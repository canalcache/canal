/**
 * Author: Chungha Sung 
 *
 * Cache API insertion in byte code
 *
 */

#include "llvm-c/Core.h"

#include "llvm/Pass.h"
#include "llvm/PassRegistry.h"
#include "llvm/PassManager.h"
#include "llvm/Transforms/IPO/PassManagerBuilder.h"

#include "llvm/Support/CommandLine.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/Support/FileSystem.h"

#include "llvm/IR/Module.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/BasicBlock.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/InstrTypes.h"
#include "llvm/IR/Type.h"
#include "llvm/IR/Constants.h"
#include "llvm/IR/GlobalVariable.h"
#include "llvm/IR/GlobalValue.h"
#include "llvm/IR/User.h"
#include "llvm/IR/Operator.h"

#include "llvm/Analysis/PostDominators.h"
#include "llvm/Analysis/DominanceFrontier.h"

#include "llvm/Config/llvm-config.h"

#if LLVM_VERSION_MAJOR == 3 && LLVM_VERSION_MINOR == 4
#include "llvm/Support/InstIterator.h"
#else
#include "llvm/IR/InstIterator.h"
#endif

#include <vector>
#include <set>
#include <map>
#include <iostream>
#include <fstream>
#include <sstream>
#include <string>
#include <algorithm>
#include <cstdint>

using namespace llvm;
using namespace std;


// Not used now
cl::opt<bool> 
  useApiI("apiInsert"
      , cl::desc("Use API insertion")
      , cl::init(false));

struct ApiInsert : public ModulePass {

    static char ID;

    ApiInsert() : ModulePass(ID) { }

	string mainFuncName = "__CSIM_MAIN__";

    // virtual address starts from 0
    unsigned long long setOffsetNum;
    unsigned long long offsetNum;
    // address map <variable name, address>
    std::map<string, unsigned long long> addrMap;
    // array check map <variable name, bool>: true->array, false->non array
    std::map<string, bool> arrCheckMap;
    // set map <variable name, set>
    std::map<string, unsigned long long> singleSetMap;
    // tags map <variable name, tags>
    std::map<string, unsigned long long> singleTagsMap;
    // size map <variable name, type size>
    std::map<string, unsigned int> singleSizeMap;
    // arraySetMap <variable name, list<address, set>>
    std::map<string, map<unsigned long long, unsigned long long>> arrSetMap;
    // arrayTagMap <variable name, map<address, tags>>
    std::map<string, map<unsigned long long, unsigned long long>> arrTagsMap;

    // global reference for read_ret & write_ret
    //GlobalValue* gReadRet;
    //GlobalValue* gWriteRet;

    Function *ReadCacheCall;
    Function *WriteCacheCall;
    Argument *ReadCache_arg1;
    Argument *ReadCache_arg2;
    Argument *WriteCache_arg1;
    Argument *WriteCache_arg2;



    bool checkSkipFun(string fName) {
        if (fName.find("__CSIM_init_cache") != std::string::npos) {
            return true;
        } else if (fName.find("__CSIM_Load") != std::string::npos) {
            return true;
        } else if (fName.find("__CSIM_Store") != std::string::npos) {
            return true;
        } else if (fName.find("__CSIM_print_stat") != std::string::npos) {
            return true;
        } else if (fName.find("__CSIM_init_stat") != std::string::npos) {
            return true;
        } else if (fName.find("printf") != std::string::npos) {
            return true;
        } else if (fName.find("assert") != std::string::npos) {
            return true;
        } else if (fName.find("__CSIM_assert") != std::string::npos) {
            return true;
        } else if (fName.find("main") != std::string::npos) {
            return true;
        } else {
            return false;
        }
    }

    bool checkSkipBB(string bName) {
        if (bName.find("CH_ELSE_BLOCK") != std::string::npos) {
            return true;
        } else if (bName.find("CH_TRUE_BLOCK") != std::string::npos) {
            return true;
        } else {
            return false;
        }
    }

    void getCacheReadWriteInfo(Module& M) {
        bool getRead = false;
        bool getWrite = false;
        // get the read & write functions
        for (auto mi=M.begin(), me=M.end(); mi != me; ++mi) {
            Function &f =  *mi;
            std::string fName = f.getName();
            if (fName.find("__CSIM_Store") != std::string::npos) {
                WriteCacheCall = &f;
                auto ari=WriteCacheCall->arg_begin();
                // get tags type
                WriteCache_arg1 = &*ari;
                ari++;
                // get set type
                WriteCache_arg2 = &*ari;
                getRead = true;
            } 
            if (fName.find("__CSIM_Load") != std::string::npos) {
                ReadCacheCall = &f;
                auto ari = ReadCacheCall->arg_begin();
                // get tags type
                ReadCache_arg1 = &*ari;
                ari++;
                // get set type
                ReadCache_arg2 = &*ari;
                getWrite = true;
            }
            if (getRead && getWrite)
                break;
        }
        if (!(getRead && getWrite)) {
            errs() << "[ERROR] Both cache_read and cache_write functions needed\n";
            exit(EXIT_FAILURE);
        }
    }

    // read the symbolTable.out file and collect all address of global variables 
    void readSymbolTable(void) {
        std::ifstream myfile("symbolTable.out");
        while(!myfile.is_open()) {
            errs() << "[ERROR] Cannot open symbolTable.out file\n";
            exit(EXIT_FAILURE);
            return;
        }
        string haystack;
        while (getline(myfile, haystack)) {
            unsigned long long baseAddr;
            string base, type, name;
            stringstream ss(haystack);
            ss >> base >> type >> name;
            stringstream convert;
            convert << std::hex << base;
            convert >> baseAddr;

            // save array information
            if (type == "B" || type == "D" || type == "R") {
                addrMap[name] = baseAddr;
                //errs() << name << ":" << to_string(baseAddr) << "\n";
            }
        }
    }

    // update addMap, setMap, tagsMap
    void saveAddressInfo(string varName, string dataType, unsigned int count) {
        if (count < 1) {
            errs() << "[ERROR] Wrong counts\n";
            exit(EXIT_FAILURE);
        }
        if (addrMap.find(varName) == addrMap.end()) {
            return;
            //errs() << "[ERROR] Var Name is not provided as address: " << varName << "\n";
            //exit(EXIT_FAILURE);
        }
        if (dataType == "i8") {
            singleSizeMap[varName] = 1;
        } else if (dataType == "i32" || dataType == "i32*") {
            singleSizeMap[varName] = 4;
        } else if (dataType == "i64") {
            singleSizeMap[varName] = 8;
        } else {
            errs() << "[ERROR] Data type not supported: " << dataType << "\n";
            exit(EXIT_FAILURE);
        }

        unsigned long long baseAddr = addrMap[varName];
        unsigned long long nextAddr = count*singleSizeMap[varName] + baseAddr;
        //errs() << "baseAddr: " << baseAddr << ", nextAddr: " << nextAddr << "\n";
        unsigned long long tags;
        unsigned long long set;
        

        // update setMap, tagsMap
        if (count == 1) {
            arrCheckMap[varName] = false;
            tags = computeTags(baseAddr);
            set = computeSet(baseAddr, tags);
            singleTagsMap[varName] = tags;
            singleSetMap[varName] = set;
        } else if (count > 1) {
            // array case
            tags = computeTags(baseAddr);
            set = computeSet(baseAddr, tags);
            singleTagsMap[varName] = tags;
            singleSetMap[varName] = set;
            arrCheckMap[varName] = true;
            map<unsigned long long, unsigned long long> tmpTagsMap;
            map<unsigned long long, unsigned long long> tmpSetMap;
            // meaning of tmpTagsMap & tmpSetMap
            // if tmpSetMap  says [0x0100, 2] => it means if the address is less than 0x100, then set is 2
            // it will be used to create branch statements for ``if (address < 0x100) set = 2;``
            baseAddr += offsetNum;
            while (baseAddr < nextAddr) {
                tmpTagsMap[baseAddr] = tags;
                tmpSetMap[baseAddr] = set;
                tags = computeTags(baseAddr);
                set = computeSet(baseAddr, tags);
                baseAddr += offsetNum;
            }
            tmpTagsMap[nextAddr] = tags;
            tmpSetMap[nextAddr] = set;
            arrTagsMap[varName] = tmpTagsMap;
            arrSetMap[varName] = tmpSetMap;
        }
    }

    // since global variables have different types, update these types
    void updateMemoryInfo(Module& M) {
        for (auto &global : M.getGlobalList()) {
            Constant* c = global.getInitializer();
            Type* initType = c->getType();
            unsigned int dataCount;
            std::string dataType;
            std::string dest = global.getName();
            llvm::raw_string_ostream rso(dataType);
            if (initType->isArrayTy()) {
                auto subType = initType->subtype_begin();
                (*(&*(subType)))->print(rso);
                rso.str();
                //errs() << "array\n";
                //errs() << global.getName() << "\n";
                dataCount = initType->getArrayNumElements();
                //errs() << dataCount << "\n";
                //errs() << dataType << "\n";

            } else if (initType->isSingleValueType()) {
                initType->print(rso);
                rso.str();
                //errs() << "single\n";
                //errs() << global.getName() << "\n";
                dataCount = 1;
                //errs() << dataCount << "\n";
                //errs() << dataType << "\n";

            } else {
                errs() << "[ERROR] Only support single value and array types\n";
                exit(EXIT_FAILURE);
            }
            saveAddressInfo(dest, dataType, dataCount);
        }

    }

    void readConfigInfo(void) {
        std::ifstream myfile("cSim.h");
        while(!myfile.is_open()) {
            errs() << "[ERROR] Cannot open configuration file\n";
            exit(EXIT_FAILURE);
            return;
        }
        string haystack;
        const string son = "#define SET_OFFSET_NUM";
        const string on = "#define OFFSET_NUM";
        bool sonCheck = false;
        bool onCheck = false;
        while (getline(myfile, haystack)) {
            if (!sonCheck && haystack.find(son) != string::npos) {
                string tmp1, tmp2;
                unsigned long long number;
                stringstream ss(haystack);
                ss >> tmp1 >> tmp2 >> number;
                setOffsetNum = number;
                sonCheck = true;
            } else if (!onCheck && haystack.find(on) != string::npos) {
                string tmp1, tmp2;
                unsigned long long number;
                stringstream ss(haystack);
                ss >> tmp1 >> tmp2 >> number;
                offsetNum = number;
                onCheck = true;
            }
            if (sonCheck && onCheck)
                break;
        }

    }

    unsigned long long computeTags(unsigned long long address)
    {
        return address/setOffsetNum;
    }

    unsigned long long computeSet(unsigned long long address, unsigned long long tags)
    {
        return (address - tags*setOffsetNum)/offsetNum;
    }



    void debugAddMap(void) {
        errs() << "=======address Map=======\n";
        for (auto it = addrMap.begin(), ie = addrMap.end(); it != ie; ++it) {
            errs() << it->first << ":" << it->second << "\n";
        }
        errs() << "=======array check map=======\n";
        for (auto it = arrCheckMap.begin(), ie = arrCheckMap.end(); it != ie; ++it) {
            errs() << it->first << ":" << it->second << "\n";
        }
        errs() << "=======address tag Map=======\n";
        for (auto it = singleTagsMap.begin(), ie = singleTagsMap.end(); it != ie; ++it) {
            errs() << it->first << ":" << it->second << "\n";
        }
        errs() << "=======address set Map=======\n";
        for (auto it = singleSetMap.begin(), ie = singleSetMap.end(); it != ie; ++it) {
            errs() << it->first << ":" << it->second << "\n";
        }
        errs() << "=======array tags & set map========\n";
        for (auto it = arrTagsMap.begin(), ie = arrTagsMap.end(); it != ie; ++it) {
            map<unsigned long long, unsigned long long> tmpTags = it->second;
            map<unsigned long long, unsigned long long> tmpSet = arrSetMap[it->first];

            errs() << it->first << "\n";
            for (auto it2 = tmpTags.begin(), ie2=tmpTags.end(); it2 != ie2; ++it2) {
                errs() << it2->first << " => tags: " << it2->second << " set: " << tmpSet[it2->first] << "\n";
            }
        }
        errs() << "======= Done ========\n";

    }

    Value* getArrFromElementPtr(GEPOperator *gp) {
        Value* indexArr = &*(gp->getPointerOperand());
        return indexArr;
    }

    Value* getIndex1FromElementPtr(GEPOperator *gp) {
        Use* te = gp->idx_begin();
        Value* index1 = &*(te->get());
        return index1;
    }

    Value* getIndex2FromElementPtr(GEPOperator *gp) {
        Use* te = gp->idx_begin();
        te++;
        Value* index2 = &*(te->get());
        return index2;
    }

    GetElementPtrInst* getElementPtrInst(Instruction* I) {
        if (GetElementPtrInst *gpi = dyn_cast<GetElementPtrInst>(I)) {
            return gpi;
        } else { 
            errs() << "[ERROR] Only GetElementPtrInst is allowed\n";
            exit(EXIT_FAILURE);
        }
    }

    unsigned long long getAddFromElementPtr(GEPOperator* gp, bool &ret) {
        
        //GetElementPtrInst *gpi = &gpiTmp;
        // check getElementPointer
        if (gp->getNumIndices() != 2) {
            errs() << "[ERROR] Multiple indices (>2) is not supported yet\n";
            errs() << *gp << "\n";
            exit(EXIT_FAILURE);
        }
        // try to get index from getElementPointer
        // In here, I only cover where there is a constant index
        unsigned long long startIndex, endIndex;
        Value* index1 = getIndex1FromElementPtr(gp);
        Value* index2 = getIndex2FromElementPtr(gp);
        Value* indexArr = getArrFromElementPtr(gp);
        if (addrMap.find(indexArr->getName()) == addrMap.end()) {
            errs() << "[ERROR] wrong array reference for GEPOperator\n";
            errs() << *gp << "\n";
            exit(EXIT_FAILURE);
        }
        unsigned long long startAddress = addrMap[indexArr->getName()];
        if (ConstantInt* coni = dyn_cast<ConstantInt>(index1)) {
            startIndex = coni->getSExtValue();
            if (startIndex != 0) {
                errs() << "[ERROR] wrong start index\n";
                exit(EXIT_FAILURE);
            }
        } else {
            errs() << "[ERROR] wrong start index\n";
            exit(EXIT_FAILURE);
        }
        if (ConstantInt* coni = dyn_cast<ConstantInt>(index2)) {
            endIndex = coni->getSExtValue();
        } else {
            ret = false;
            return startAddress;
        }
        //errs() << "index1: " << startIndex << ", index2: " << endIndex << "\n";
        //errs() << indexArr->getName() << "\n";
        unsigned int dataSize = singleSizeMap[indexArr->getName()];
        unsigned long long actualIndex = endIndex - startIndex;
        unsigned long long actualAddress = startAddress + dataSize*actualIndex;
        ret = true;
        return actualAddress;
    }


    void insertCacheWR(Instruction* I, unsigned long long tags, unsigned long long set, bool isStore) 
    {
        Value *tags_arg, *set_arg;
        if (isStore) {
            tags_arg = ConstantInt::get(WriteCache_arg1->getType(), tags, false);
            set_arg = ConstantInt::get(WriteCache_arg2->getType(), set, false);
        } else {
            tags_arg = ConstantInt::get(ReadCache_arg1->getType(), tags, false);
            set_arg = ConstantInt::get(ReadCache_arg2->getType(), set, false);
        }
        vector<llvm::Value*> op;
        op.push_back(tags_arg);
        op.push_back(set_arg);
        Instruction *call;
        if (isStore) {
            call = CallInst::Create(WriteCacheCall, makeArrayRef(op));
        } else {
            call = CallInst::Create(ReadCacheCall, makeArrayRef(op));
        }
        call->insertAfter(I);
    }



    // return the true part of block based on tags and set.
    BasicBlock* createTrueWRBlock(LLVMContext& context, Function* f, unsigned long long tags, unsigned long long set, bool isStore)
    {
        BasicBlock* trueB = BasicBlock::Create(context, Twine("CH_TRUE_BLOCK"), f);
        Value *tags_arg, *set_arg;
        if (isStore) {
            tags_arg = ConstantInt::get(WriteCache_arg1->getType(), tags, false);
            set_arg = ConstantInt::get(WriteCache_arg2->getType(), set, false);
        } else {
            tags_arg = ConstantInt::get(ReadCache_arg1->getType(), tags, false);
            set_arg = ConstantInt::get(ReadCache_arg2->getType(), set, false);
        }
        vector<llvm::Value*> op;
        op.push_back(tags_arg);
        op.push_back(set_arg);
        Instruction *call;
        if (isStore) {
            call = CallInst::Create(WriteCacheCall, makeArrayRef(op));
        } else {
            call = CallInst::Create(ReadCacheCall, makeArrayRef(op));
        }
        trueB->getInstList().push_back(call);
        return trueB;
    }

    // return a basic block which contains condition computation for else block
    // Condition insturction will be the last instruction in the returned basic block
    Instruction *elseLast;
    BasicBlock* createElseBlock(LLVMContext& context, Function* f, unsigned long long arrAddress, unsigned long long compAddress, Value* i, unsigned int size)
    {
        // condition means
        // (arrAddress + i*size < compAddress)
        BasicBlock* elseB = BasicBlock::Create(context, Twine("CH_ELSE_BLOCK"), f);
        ConstantInt* addVal = ConstantInt::get(IntegerType::get(context, 64), arrAddress);
        ConstantInt* n4 = ConstantInt::get(IntegerType::get(context, 64), size);
        BinaryOperator* i4 = BinaryOperator::Create(Instruction::Mul, n4, i, Twine("CH_OFFSET"));
        elseB->getInstList().push_back(i4);
        BinaryOperator* left = BinaryOperator::Create(Instruction::Add, i4, addVal, Twine("CH_LEFT"));
        elseB->getInstList().push_back(left);
        ConstantInt* right = ConstantInt::get(IntegerType::get(context, 64), compAddress);
        CmpInst* condition = CmpInst::Create(Instruction::ICmp, CmpInst::ICMP_ULT, left, right, Twine("CH_COND"));
        elseB->getInstList().push_back(condition);
        elseLast = condition;
        return elseB;
    }

    // return a basic block which contains condition computation. 
    // Condition insturction will be the last instruction in the returned basic block
    Instruction* connectCondition(LLVMContext& context, Instruction* I, unsigned long long arrAddress, unsigned long long compAddress, Value* i, unsigned int size)
    {
        ConstantInt* addVal = ConstantInt::get(IntegerType::get(context, 64), arrAddress);
        ConstantInt* n4 = ConstantInt::get(IntegerType::get(context, 64), size);
        BinaryOperator* i4 = BinaryOperator::Create(Instruction::Mul, n4, i, Twine("CH_OFFSET"));
        i4->insertAfter(I);
        BinaryOperator* left = BinaryOperator::Create(Instruction::Add, i4, addVal, Twine("CH_LEFT"));
        left->insertAfter(i4);
        ConstantInt* right = ConstantInt::get(IntegerType::get(context, 64), compAddress);
        CmpInst* condition = CmpInst::Create(Instruction::ICmp, CmpInst::ICMP_ULT, left, right, Twine("CH_COND"));
        condition->insertAfter(left);
        return condition;
    }

    void printBasicBlock(BasicBlock *b) {
        errs() << "====" << b->getName() << "====\n";
        for (auto bi=b->begin(), be=b->end(); bi != be; ++bi) {
            Instruction *I = &*bi;
            errs() << *I << "\n";
        }
        errs() << "===============================\n";
    }


    void arrCacheWR(LLVMContext& context, Function& f, BasicBlock& bb, GEPOperator* gp, Instruction* I, bool isStore) {

        bool ret = false;
        unsigned long long ptrAddress = getAddFromElementPtr(gp, ret);
        if (ret) {
            // if index is constant, then put address
            unsigned long long tags = computeTags(ptrAddress);
            unsigned long long set = computeSet(ptrAddress, tags);
            /*
            errs() << "constant!\n";
            errs() << "address: " << ptrAddress << "\n";
            errs() << "tags: " << tags << ", set: " << set << "\n";
            */
            insertCacheWR(I, tags, set, isStore);
        } else {
            // if index is not constant, then create branches
            //errs() << "non constant!\n";
            Value* index = getIndex2FromElementPtr(gp);
            Value* arr = getArrFromElementPtr(gp);
            unsigned int size = singleSizeMap[arr->getName()];
            map<unsigned long long, unsigned long long> tagsMap = arrTagsMap[arr->getName()];
            map<unsigned long long, unsigned long long> setMap = arrSetMap[arr->getName()];
            // get terminator first
            // terminator is used for connecting blocks
            TerminatorInst *terminator = &*(bb.getTerminator());
            BasicBlock* nextB = terminator->getSuccessor(0);
            terminator->eraseFromParent();
            bool first = true;
            // iterate tagsMap and setMap to generate each branch
            //errs() << "Iterate!========\n";
            Instruction* lastCond;
            for (auto itm=tagsMap.begin(); itm != tagsMap.end(); ++itm) {
                unsigned long long compAddress = itm->first;
                unsigned long long tags = itm->second;
                unsigned long long set = setMap[compAddress];
                //errs() << "compAddress: " << compAddress << ", tags: " << tags << ", set: " << set << "\n";
                if (first) {
                    lastCond = connectCondition(context, I, ptrAddress, compAddress, index, size);
                    first = false;
                } 
                // add conditions
                auto itmNext = itm;
                itmNext++;
                if (itmNext == tagsMap.end()) {
                    // if it is the last, one just connect else to the terminator without creating the conditions
                    // create true block
                    
                    BasicBlock* trueB = createTrueWRBlock(context, &f, tags, set, isStore);
                    // connect all blocks
                    BranchInst* bit = BranchInst::Create(trueB, nextB, lastCond);
                    bit->insertAfter(lastCond);
                    BranchInst::Create(nextB, trueB);
                } else {
                    // create else block 
                    unsigned long long nextCompAddress = itmNext->first;
                    BasicBlock* elseB = createElseBlock(context, &f, ptrAddress, nextCompAddress, index, size);
                    // create true block
                    BasicBlock* trueB = createTrueWRBlock(context, &f, tags, set, isStore);
                    // connect all blocks
                    BranchInst* bit = BranchInst::Create(trueB, elseB, lastCond);
                    bit->insertAfter(lastCond);
                    lastCond = elseLast;
                    BranchInst::Create(nextB, trueB);
                    //printBasicBlock(elseB);
                }

            }
        }
    }

    bool runOnModule(Module &M) {

        // get global variables for read_ret & write_ret
        //gReadRet = M.getGlobalVariable(StringRef("__CSIM_read_ret"));
        //gWriteRet = M.getGlobalVariable(StringRef("__CSIM_write_ret"));


        // read cache configuration file
        readConfigInfo();
        // get cache_read and cache_write information
        getCacheReadWriteInfo(M);
        // read symbolTable
        readSymbolTable();
        // update memory information
        updateMemoryInfo(M);
        // for debug
        //debugAddMap();

        // split basic blocks for each load and store
        for (auto mi=M.begin(), me=M.end(); mi != me; ++mi) {
            Function &f = *mi;
            if (!checkSkipFun(f.getName())) {
                for (auto fi=f.begin(), fe=f.end(); fi != fe; ++fi) {
                    BasicBlock &bb = *fi;
                    for (auto bi=bb.begin(), be=bb.end(); bi != be; ++bi) {
                        Instruction *I = &*bi;
                        if (dyn_cast<LoadInst>(I)) {
                            auto btmp = bi;
                            auto btmp2 = be;
                            btmp ++;
                            btmp2 --;
                            if (btmp != btmp2) {
                                Instruction *next = &*btmp;
                                bb.splitBasicBlock(next, Twine("CH_LDB"));
                            }
                        } else if (dyn_cast<StoreInst>(I)) {
                            auto btmp = bi;
                            auto btmp2 = be;
                            btmp ++;
                            btmp2 --;
                            if (btmp != btmp2) {
                                Instruction *next = &*btmp;
                                bb.splitBasicBlock(next, Twine("CH_STB"));
                            }
                        }
                    }
                }
            }
        }

        errs() << "===========split done============\n";
        /*

        errs() << "=================For comparison===================\n";
        // Prints changed insturctions
        for (auto mi=M.begin(), me=M.end(); mi != me; ++mi) {
            Function &f =  *mi;
            if (f.getName().find(mainFuncName) != std::string::npos) {
                for (auto fi=f.begin(), fe=f.end(); fi != fe; ++fi) {
                    BasicBlock &bb = *fi;
                    errs() << "==========" << bb.getName() << "========" << "\n";
                    for (auto bi=bb.begin(), be=bb.end(); bi != be; ++bi) {
                        Instruction *I = &*bi;
                        errs() << *I << "\n";
                        
                    }
                }
            }
        }
        */



        // Traverse all instructions
        for (auto mi=M.begin(), me=M.end(); mi != me; ++mi) {
            Function &f =  *mi;
            if (checkSkipFun(f.getName()))
                continue;
            LLVMContext& context = f.getContext();
            for (auto fi=f.begin(), fe=f.end(); fi != fe; ++fi) {
                BasicBlock &bb = *fi;
                if (checkSkipBB(bb.getName())) 
                    continue;
                for (auto bi=bb.begin(), be=bb.end(); bi != be; ++bi) {
                    Instruction *I = &*bi;
                    //errs() << *I << "\n";
                    if (LoadInst *li = dyn_cast<LoadInst>(I)) {
                        Value* liop = &*(li->getPointerOperand());
                        if (GEPOperator *gp = dyn_cast<GEPOperator>(liop)) {
                            // array access
                            arrCacheWR(context, f, bb, gp, I, false);
                        } else {
                            // simple access
                            // if there is an address information, simply put it
                            // do the simple thing
                            if (liop->getName().find("__CSIM_") != std::string::npos) {
                                continue;
                            } else if (addrMap.find(liop->getName()) != addrMap.end()) {
                                unsigned long long tags = singleTagsMap[liop->getName()];
                                unsigned long long set = singleSetMap[liop->getName()];
                                insertCacheWR(li, tags, set, false);
                            } else {
                                // TODO: function call related...out
                                continue;
                            }
                        }
                    } else if (StoreInst *si = dyn_cast<StoreInst>(I)) {
                        Value* siop = &*(si->getPointerOperand());
                        if (GEPOperator *gp = dyn_cast<GEPOperator>(siop)) {
                            // array access
                            arrCacheWR(context, f, bb, gp, I, true);
                        } else {
                            // simple access
                            // if there is an address information, simply put it
                            // do the simple thing
                            if (siop->getName().find("__CSIM_") != std::string::npos) {
                                continue;
                            } else if (addrMap.find(siop->getName()) != addrMap.end()) {
                                unsigned long long tags = singleTagsMap[siop->getName()];
                                unsigned long long set = singleSetMap[siop->getName()];
                                insertCacheWR(si, tags, set, true);
                            } else {
                                // TODO: function call related...out
                                continue;
                            }
                        }
                    }
                } // Instruction
            } // basic block
        } // module
        //tt->insertInto(tf, tb);

        /*
        errs() << "=================For comparison===================\n";
        // Prints changed insturctions
        for (auto mi=M.begin(), me=M.end(); mi != me; ++mi) {
            Function &f =  *mi;
            if (f.getName().find(mainFuncName) != std::string::npos) {
                for (auto fi=f.begin(), fe=f.end(); fi != fe; ++fi) {
                    BasicBlock &bb = *fi;
                    errs() << "==========" << bb.getName() << "========" << "\n";
                    for (auto bi=bb.begin(), be=bb.end(); bi != be; ++bi) {
                        Instruction *I = &*bi;
                        errs() << *I << "\n";

                    }
                }
            }
        }
        */

        // the transformation is modified
        return true;
    }

}; // struct ApiInsert

// Pass info
char ApiInsert::ID = 0;
static RegisterPass<ApiInsert> X("ApiInsert"
        , "API insertion pass"
        , false  // Only looks at CFG
        , false); // Analysis Pass


    /*
    // update addMap, setMap, tagsMap
    void saveAddressInfo(string varName, string dataType, unsigned int align, unsigned int count) {
        if (count < 1) {
            errs() << "[ERROR] Wrong counts\n";
            exit(EXIT_FAILURE);
        }
        while (vAddress % align != 0) {
            vAddress++;
        }
        addrMap[varName] = vAddress;
        unsigned long long nextAdd;
        if (dataType == "i32" || dataType == "i64") {
            nextAdd = vAddress + count*4;
            singleSizeMap[varName] = 4;
        } else {
            errs() << "[ERROR] Data type not supported\n";
            exit(EXIT_FAILURE);
        }
        unsigned long long tags;
        unsigned long long set;

        // update setMap, tagsMap
        if (count == 1) {
            arrCheckMap[varName] = false;
            tags = computeTags(vAddress);
            set = computeSet(vAddress, tags);
            singleTagsMap[varName] = tags;
            singleSetMap[varName] = set;
        } else if (count > 1) {
            // array case
            //errs() << "array case\n";
            tags = computeTags(vAddress);
            set = computeSet(vAddress, tags);
            singleTagsMap[varName] = tags;
            singleSetMap[varName] = set;
            arrCheckMap[varName] = true;
            map<unsigned long long, unsigned long long> tmpTagsMap;
            map<unsigned long long, unsigned long long> tmpSetMap;
            // meaning of tmpTagsMap & tmpSetMap
            // if tmpSetMap  says [0x0100, 2] => it means if the address is less than 0x100, then set is 2
            // it will be used to create branch statements for ``if (address < 0x100) set = 2;``
            vAddress += offsetNum;
            while (vAddress < nextAdd) {
                tmpTagsMap[vAddress] = tags;
                tmpSetMap[vAddress] = set;
                tags = computeTags(vAddress);
                set = computeSet(vAddress, tags);
                vAddress += offsetNum;
            }
            tmpTagsMap[nextAdd] = tags;
            tmpSetMap[nextAdd] = set;
            arrTagsMap[varName] = tmpTagsMap;
            arrSetMap[varName] = tmpSetMap;
        }
        vAddress = nextAdd;
    }
    */

    /*
    // collect all allocations in a program
    void collectAlloca(Module &M) {
        for (auto mi=M.begin(), me=M.end(); mi != me; ++mi) {
            Function &f =  *mi;
            if (!checkSkipFun(f.getName())) {
                for (auto fi=f.begin(), fe=f.end(); fi != fe; ++fi) {
                    BasicBlock &bb = *fi;
                    for (auto bi=bb.begin(), be=bb.end(); bi != be; ++bi) {
                        Instruction *I = &*bi;
                        //errs() << *I << "\n";
                        if (AllocaInst *ai = dyn_cast<AllocaInst>(I)) {
                            errs() << "Inst: " << *ai << "\n";
                            Type *aiType = &*(ai->getAllocatedType());
                            //Type *aiSub = &*aiSubi;
                            std::string dest = (ai->getName()).str();
                            // TODO: Function call related has no name
                            if (dest == "") {
                                continue;
                            }
                            errs() << "Dest: " << dest << "\n";
                            std::string dataType;
                            llvm::raw_string_ostream rso(dataType);
                            unsigned int dataCount;
                            unsigned int align = ai->getAlignment();
                            if (aiType->isArrayTy()) {
                                // array allocation
                                auto aiSubi = aiType->subtype_begin();
                                (*(&*(aiSubi)))->print(rso);
                                rso.str();
                                dataCount = aiType->getArrayNumElements();

                                //errs() << "firstSubType: " << *(*aiSubi) << "\n";
                                //errs() << "array allocation\n";
                                //errs() << "arrayType: " << dataType << "\n";
                                //errs() << arrSize << "\n";
                                //errs() << "getAlignment: " << align << "\n";
                            } else if (aiType -> isSingleValueType()) {
                                // non array allocation
                                aiType->print(rso);
                                rso.str();
                                dataCount = 1;
                                //errs() << "non array allocation\n";
                                //errs() << "dataType: " << dataType << "\n";
                                //errs() << "getAlignment: " << align << "\n";

                            } else {
                                errs() << "[ERROR] Only support single value and array types\n";
                                exit(EXIT_FAILURE);
                            }
                            saveAddressInfo(dest, dataType, align, dataCount);
                        }
                    }
                }
            }
        }
    }
    */

