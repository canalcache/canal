; ModuleID = 'main.bc'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__CSIM_num_Load_hit = common global i32 0, align 4
@__CSIM_num_Load_miss = common global i32 0, align 4
@__CSIM_num_Store_hit = common global i32 0, align 4
@__CSIM_num_Store_miss = common global i32 0, align 4
@__CSIM_Load_ret = common global i8 0, align 1
@__CSIM_Store_ret = common global i8 0, align 1
@__CSIM_cLine00_tags = common global i64 0, align 8
@__CSIM_cLine01_tags = common global i64 0, align 8
@__CSIM_cLine02_tags = common global i64 0, align 8
@__CSIM_cLine03_tags = common global i64 0, align 8
@__CSIM_cLine10_tags = common global i64 0, align 8
@__CSIM_cLine11_tags = common global i64 0, align 8
@__CSIM_cLine12_tags = common global i64 0, align 8
@__CSIM_cLine13_tags = common global i64 0, align 8
@__CSIM_cLine20_tags = common global i64 0, align 8
@__CSIM_cLine21_tags = common global i64 0, align 8
@__CSIM_cLine22_tags = common global i64 0, align 8
@__CSIM_cLine23_tags = common global i64 0, align 8
@__CSIM_cLine30_tags = common global i64 0, align 8
@__CSIM_cLine31_tags = common global i64 0, align 8
@__CSIM_cLine32_tags = common global i64 0, align 8
@__CSIM_cLine33_tags = common global i64 0, align 8
@__CSIM_cLine00_rank = common global i64 0, align 8
@__CSIM_cLine01_rank = common global i64 0, align 8
@__CSIM_cLine02_rank = common global i64 0, align 8
@__CSIM_cLine03_rank = common global i64 0, align 8
@__CSIM_cLine10_rank = common global i64 0, align 8
@__CSIM_cLine11_rank = common global i64 0, align 8
@__CSIM_cLine12_rank = common global i64 0, align 8
@__CSIM_cLine13_rank = common global i64 0, align 8
@__CSIM_cLine20_rank = common global i64 0, align 8
@__CSIM_cLine21_rank = common global i64 0, align 8
@__CSIM_cLine22_rank = common global i64 0, align 8
@__CSIM_cLine23_rank = common global i64 0, align 8
@__CSIM_cLine30_rank = common global i64 0, align 8
@__CSIM_cLine31_rank = common global i64 0, align 8
@__CSIM_cLine32_rank = common global i64 0, align 8
@__CSIM_cLine33_rank = common global i64 0, align 8
@__CSIM_cLine00_taken = common global i8 0, align 1
@__CSIM_cLine01_taken = common global i8 0, align 1
@__CSIM_cLine02_taken = common global i8 0, align 1
@__CSIM_cLine03_taken = common global i8 0, align 1
@__CSIM_cLine10_taken = common global i8 0, align 1
@__CSIM_cLine11_taken = common global i8 0, align 1
@__CSIM_cLine12_taken = common global i8 0, align 1
@__CSIM_cLine13_taken = common global i8 0, align 1
@__CSIM_cLine20_taken = common global i8 0, align 1
@__CSIM_cLine21_taken = common global i8 0, align 1
@__CSIM_cLine22_taken = common global i8 0, align 1
@__CSIM_cLine23_taken = common global i8 0, align 1
@__CSIM_cLine30_taken = common global i8 0, align 1
@__CSIM_cLine31_taken = common global i8 0, align 1
@__CSIM_cLine32_taken = common global i8 0, align 1
@__CSIM_cLine33_taken = common global i8 0, align 1
@__CSIM_cLine00_dirty = common global i8 0, align 1
@__CSIM_cLine01_dirty = common global i8 0, align 1
@__CSIM_cLine02_dirty = common global i8 0, align 1
@__CSIM_cLine03_dirty = common global i8 0, align 1
@__CSIM_cLine10_dirty = common global i8 0, align 1
@__CSIM_cLine11_dirty = common global i8 0, align 1
@__CSIM_cLine12_dirty = common global i8 0, align 1
@__CSIM_cLine13_dirty = common global i8 0, align 1
@__CSIM_cLine20_dirty = common global i8 0, align 1
@__CSIM_cLine21_dirty = common global i8 0, align 1
@__CSIM_cLine22_dirty = common global i8 0, align 1
@__CSIM_cLine23_dirty = common global i8 0, align 1
@__CSIM_cLine30_dirty = common global i8 0, align 1
@__CSIM_cLine31_dirty = common global i8 0, align 1
@__CSIM_cLine32_dirty = common global i8 0, align 1
@__CSIM_cLine33_dirty = common global i8 0, align 1
@.str = private unnamed_addr constant [13 x i8] c"SET_NUM: %d\0A\00", align 1
@.str1 = private unnamed_addr constant [16 x i8] c"OFFSET_NUM: %d\0A\00", align 1
@.str2 = private unnamed_addr constant [13 x i8] c"WAY_NUM: %d\0A\00", align 1
@.str3 = private unnamed_addr constant [18 x i8] c"Total Length: %d\0A\00", align 1
@.str4 = private unnamed_addr constant [37 x i8] c"===============STAT================\0A\00", align 1
@.str5 = private unnamed_addr constant [25 x i8] c"Total memory access: %d\0A\00", align 1
@.str6 = private unnamed_addr constant [24 x i8] c"Total memeory load: %d\0A\00", align 1
@.str7 = private unnamed_addr constant [25 x i8] c"Total CSIM_Load hit: %d\0A\00", align 1
@.str8 = private unnamed_addr constant [26 x i8] c"Total CSIM_Load miss: %d\0A\00", align 1
@.str9 = private unnamed_addr constant [24 x i8] c"Total memory store: %d\0A\00", align 1
@.str10 = private unnamed_addr constant [26 x i8] c"Total CSIM_Store hit: %d\0A\00", align 1
@.str11 = private unnamed_addr constant [27 x i8] c"Total CSIM_Store miss: %d\0A\00", align 1
@multi = common global i32 0, align 64
@i = common global i32 0, align 64
@a = common global [200 x i32] zeroinitializer, align 64
@.str12 = private unnamed_addr constant [2 x i8] c"a\00", align 1
@.str13 = private unnamed_addr constant [2 x i8] c"b\00", align 1
@.str14 = private unnamed_addr constant [19 x i8] c"access1 == access2\00", align 1
@.str15 = private unnamed_addr constant [6 x i8] c"tmp.c\00", align 1
@__PRETTY_FUNCTION__.main = private unnamed_addr constant [11 x i8] c"int main()\00", align 1
@.str16 = private unnamed_addr constant [25 x i8] c"writemiss1 == writemiss2\00", align 1
@.str17 = private unnamed_addr constant [12 x i8] c"klee_choose\00", align 1
@.str118 = private unnamed_addr constant [57 x i8] c"/home/gpsim/klee/runtime/Intrinsic/klee_div_zero_check.c\00", align 1
@.str1219 = private unnamed_addr constant [15 x i8] c"divide by zero\00", align 1
@.str220 = private unnamed_addr constant [8 x i8] c"div.err\00", align 1
@.str321 = private unnamed_addr constant [8 x i8] c"IGNORED\00", align 1
@.str1422 = private unnamed_addr constant [16 x i8] c"overshift error\00", align 1
@.str25 = private unnamed_addr constant [14 x i8] c"overshift.err\00", align 1
@.str623 = private unnamed_addr constant [48 x i8] c"/home/gpsim/klee/runtime/Intrinsic/klee_range.c\00", align 1
@.str1724 = private unnamed_addr constant [14 x i8] c"invalid range\00", align 1
@.str28 = private unnamed_addr constant [5 x i8] c"user\00", align 1

; Function Attrs: nounwind uwtable
define void @__CSIM_init_stat() #0 {
  store i32 0, i32* @__CSIM_num_Load_hit, align 4
  store i32 0, i32* @__CSIM_num_Load_miss, align 4
  store i32 0, i32* @__CSIM_num_Store_hit, align 4
  store i32 0, i32* @__CSIM_num_Store_miss, align 4
  store i8 0, i8* @__CSIM_Load_ret, align 1
  store i8 0, i8* @__CSIM_Store_ret, align 1
  ret void
}

; Function Attrs: nounwind uwtable
define void @__CSIM_init_cache() #0 {
  store i32 0, i32* @__CSIM_num_Load_hit, align 4
  store i32 0, i32* @__CSIM_num_Load_miss, align 4
  store i32 0, i32* @__CSIM_num_Store_hit, align 4
  store i32 0, i32* @__CSIM_num_Store_miss, align 4
  store i8 0, i8* @__CSIM_Load_ret, align 1
  store i8 0, i8* @__CSIM_Store_ret, align 1
  store i64 0, i64* @__CSIM_cLine00_tags, align 8
  store i64 0, i64* @__CSIM_cLine01_tags, align 8
  store i64 0, i64* @__CSIM_cLine02_tags, align 8
  store i64 0, i64* @__CSIM_cLine03_tags, align 8
  store i64 0, i64* @__CSIM_cLine10_tags, align 8
  store i64 0, i64* @__CSIM_cLine11_tags, align 8
  store i64 0, i64* @__CSIM_cLine12_tags, align 8
  store i64 0, i64* @__CSIM_cLine13_tags, align 8
  store i64 0, i64* @__CSIM_cLine20_tags, align 8
  store i64 0, i64* @__CSIM_cLine21_tags, align 8
  store i64 0, i64* @__CSIM_cLine22_tags, align 8
  store i64 0, i64* @__CSIM_cLine23_tags, align 8
  store i64 0, i64* @__CSIM_cLine30_tags, align 8
  store i64 0, i64* @__CSIM_cLine31_tags, align 8
  store i64 0, i64* @__CSIM_cLine32_tags, align 8
  store i64 0, i64* @__CSIM_cLine33_tags, align 8
  store i64 0, i64* @__CSIM_cLine00_rank, align 8
  store i64 0, i64* @__CSIM_cLine01_rank, align 8
  store i64 0, i64* @__CSIM_cLine02_rank, align 8
  store i64 0, i64* @__CSIM_cLine03_rank, align 8
  store i64 0, i64* @__CSIM_cLine10_rank, align 8
  store i64 0, i64* @__CSIM_cLine11_rank, align 8
  store i64 0, i64* @__CSIM_cLine12_rank, align 8
  store i64 0, i64* @__CSIM_cLine13_rank, align 8
  store i64 0, i64* @__CSIM_cLine20_rank, align 8
  store i64 0, i64* @__CSIM_cLine21_rank, align 8
  store i64 0, i64* @__CSIM_cLine22_rank, align 8
  store i64 0, i64* @__CSIM_cLine23_rank, align 8
  store i64 0, i64* @__CSIM_cLine30_rank, align 8
  store i64 0, i64* @__CSIM_cLine31_rank, align 8
  store i64 0, i64* @__CSIM_cLine32_rank, align 8
  store i64 0, i64* @__CSIM_cLine33_rank, align 8
  store i8 0, i8* @__CSIM_cLine00_taken, align 1
  store i8 0, i8* @__CSIM_cLine01_taken, align 1
  store i8 0, i8* @__CSIM_cLine02_taken, align 1
  store i8 0, i8* @__CSIM_cLine03_taken, align 1
  store i8 0, i8* @__CSIM_cLine10_taken, align 1
  store i8 0, i8* @__CSIM_cLine11_taken, align 1
  store i8 0, i8* @__CSIM_cLine12_taken, align 1
  store i8 0, i8* @__CSIM_cLine13_taken, align 1
  store i8 0, i8* @__CSIM_cLine20_taken, align 1
  store i8 0, i8* @__CSIM_cLine21_taken, align 1
  store i8 0, i8* @__CSIM_cLine22_taken, align 1
  store i8 0, i8* @__CSIM_cLine23_taken, align 1
  store i8 0, i8* @__CSIM_cLine30_taken, align 1
  store i8 0, i8* @__CSIM_cLine31_taken, align 1
  store i8 0, i8* @__CSIM_cLine32_taken, align 1
  store i8 0, i8* @__CSIM_cLine33_taken, align 1
  store i8 0, i8* @__CSIM_cLine00_dirty, align 1
  store i8 0, i8* @__CSIM_cLine01_dirty, align 1
  store i8 0, i8* @__CSIM_cLine02_dirty, align 1
  store i8 0, i8* @__CSIM_cLine03_dirty, align 1
  store i8 0, i8* @__CSIM_cLine10_dirty, align 1
  store i8 0, i8* @__CSIM_cLine11_dirty, align 1
  store i8 0, i8* @__CSIM_cLine12_dirty, align 1
  store i8 0, i8* @__CSIM_cLine13_dirty, align 1
  store i8 0, i8* @__CSIM_cLine20_dirty, align 1
  store i8 0, i8* @__CSIM_cLine21_dirty, align 1
  store i8 0, i8* @__CSIM_cLine22_dirty, align 1
  store i8 0, i8* @__CSIM_cLine23_dirty, align 1
  store i8 0, i8* @__CSIM_cLine30_dirty, align 1
  store i8 0, i8* @__CSIM_cLine31_dirty, align 1
  store i8 0, i8* @__CSIM_cLine32_dirty, align 1
  store i8 0, i8* @__CSIM_cLine33_dirty, align 1
  %1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([13 x i8]* @.str, i32 0, i32 0), i32 4)
  %2 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([16 x i8]* @.str1, i32 0, i32 0), i32 64)
  %3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([13 x i8]* @.str2, i32 0, i32 0), i32 4)
  %4 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([18 x i8]* @.str3, i32 0, i32 0), i32 16)
  ret void
}

declare i32 @printf(i8*, ...) #1

; Function Attrs: nounwind uwtable
define void @__CSIM_Load(i64 %tags, i64 %set) #0 {
  %1 = alloca i64, align 8
  %2 = alloca i64, align 8
  store i64 %tags, i64* %1, align 8
  store i64 %set, i64* %2, align 8
  %3 = load i64* %2, align 8
  %4 = icmp eq i64 %3, 0
  br i1 %4, label %5, label %131

; <label>:5                                       ; preds = %0
  %6 = load i64* @__CSIM_cLine00_rank, align 8
  %7 = add i64 %6, 1
  store i64 %7, i64* @__CSIM_cLine00_rank, align 8
  %8 = load i64* @__CSIM_cLine01_rank, align 8
  %9 = add i64 %8, 1
  store i64 %9, i64* @__CSIM_cLine01_rank, align 8
  %10 = load i64* @__CSIM_cLine02_rank, align 8
  %11 = add i64 %10, 1
  store i64 %11, i64* @__CSIM_cLine02_rank, align 8
  %12 = load i64* @__CSIM_cLine03_rank, align 8
  %13 = add i64 %12, 1
  store i64 %13, i64* @__CSIM_cLine03_rank, align 8
  %14 = load i8* @__CSIM_cLine00_taken, align 1
  %15 = trunc i8 %14 to i1
  br i1 %15, label %16, label %23

; <label>:16                                      ; preds = %5
  %17 = load i64* @__CSIM_cLine00_tags, align 8
  %18 = load i64* %1, align 8
  %19 = icmp eq i64 %17, %18
  br i1 %19, label %20, label %23

; <label>:20                                      ; preds = %16
  %21 = load i32* @__CSIM_num_Load_hit, align 4
  %22 = add i32 %21, 1
  store i32 %22, i32* @__CSIM_num_Load_hit, align 4
  store i64 0, i64* @__CSIM_cLine00_rank, align 8
  store i8 1, i8* @__CSIM_Load_ret, align 1
  br label %518

; <label>:23                                      ; preds = %16, %5
  %24 = load i8* @__CSIM_cLine01_taken, align 1
  %25 = trunc i8 %24 to i1
  br i1 %25, label %26, label %33

; <label>:26                                      ; preds = %23
  %27 = load i64* @__CSIM_cLine01_tags, align 8
  %28 = load i64* %1, align 8
  %29 = icmp eq i64 %27, %28
  br i1 %29, label %30, label %33

; <label>:30                                      ; preds = %26
  %31 = load i32* @__CSIM_num_Load_hit, align 4
  %32 = add i32 %31, 1
  store i32 %32, i32* @__CSIM_num_Load_hit, align 4
  store i64 0, i64* @__CSIM_cLine01_rank, align 8
  store i8 1, i8* @__CSIM_Load_ret, align 1
  br label %518

; <label>:33                                      ; preds = %26, %23
  %34 = load i8* @__CSIM_cLine02_taken, align 1
  %35 = trunc i8 %34 to i1
  br i1 %35, label %36, label %43

; <label>:36                                      ; preds = %33
  %37 = load i64* @__CSIM_cLine02_tags, align 8
  %38 = load i64* %1, align 8
  %39 = icmp eq i64 %37, %38
  br i1 %39, label %40, label %43

; <label>:40                                      ; preds = %36
  %41 = load i32* @__CSIM_num_Load_hit, align 4
  %42 = add i32 %41, 1
  store i32 %42, i32* @__CSIM_num_Load_hit, align 4
  store i64 0, i64* @__CSIM_cLine02_rank, align 8
  store i8 1, i8* @__CSIM_Load_ret, align 1
  br label %518

; <label>:43                                      ; preds = %36, %33
  %44 = load i8* @__CSIM_cLine03_taken, align 1
  %45 = trunc i8 %44 to i1
  br i1 %45, label %46, label %53

; <label>:46                                      ; preds = %43
  %47 = load i64* @__CSIM_cLine03_tags, align 8
  %48 = load i64* %1, align 8
  %49 = icmp eq i64 %47, %48
  br i1 %49, label %50, label %53

; <label>:50                                      ; preds = %46
  %51 = load i32* @__CSIM_num_Load_hit, align 4
  %52 = add i32 %51, 1
  store i32 %52, i32* @__CSIM_num_Load_hit, align 4
  store i64 0, i64* @__CSIM_cLine03_rank, align 8
  store i8 1, i8* @__CSIM_Load_ret, align 1
  br label %518

; <label>:53                                      ; preds = %46, %43
  %54 = load i32* @__CSIM_num_Load_miss, align 4
  %55 = add i32 %54, 1
  store i32 %55, i32* @__CSIM_num_Load_miss, align 4
  store i8 0, i8* @__CSIM_Load_ret, align 1
  %56 = load i8* @__CSIM_cLine00_taken, align 1
  %57 = trunc i8 %56 to i1
  br i1 %57, label %60, label %58

; <label>:58                                      ; preds = %53
  store i8 1, i8* @__CSIM_cLine00_taken, align 1
  %59 = load i64* %1, align 8
  store i64 %59, i64* @__CSIM_cLine00_tags, align 8
  store i64 0, i64* @__CSIM_cLine00_rank, align 8
  br label %518

; <label>:60                                      ; preds = %53
  %61 = load i8* @__CSIM_cLine01_taken, align 1
  %62 = trunc i8 %61 to i1
  br i1 %62, label %65, label %63

; <label>:63                                      ; preds = %60
  store i8 1, i8* @__CSIM_cLine01_taken, align 1
  %64 = load i64* %1, align 8
  store i64 %64, i64* @__CSIM_cLine01_tags, align 8
  store i64 0, i64* @__CSIM_cLine01_rank, align 8
  br label %518

; <label>:65                                      ; preds = %60
  %66 = load i8* @__CSIM_cLine02_taken, align 1
  %67 = trunc i8 %66 to i1
  br i1 %67, label %70, label %68

; <label>:68                                      ; preds = %65
  store i8 1, i8* @__CSIM_cLine02_taken, align 1
  %69 = load i64* %1, align 8
  store i64 %69, i64* @__CSIM_cLine02_tags, align 8
  store i64 0, i64* @__CSIM_cLine02_rank, align 8
  br label %518

; <label>:70                                      ; preds = %65
  %71 = load i8* @__CSIM_cLine03_taken, align 1
  %72 = trunc i8 %71 to i1
  br i1 %72, label %75, label %73

; <label>:73                                      ; preds = %70
  store i8 1, i8* @__CSIM_cLine03_taken, align 1
  %74 = load i64* %1, align 8
  store i64 %74, i64* @__CSIM_cLine03_tags, align 8
  store i64 0, i64* @__CSIM_cLine03_rank, align 8
  br label %518

; <label>:75                                      ; preds = %70
  %76 = load i64* @__CSIM_cLine00_rank, align 8
  %77 = load i64* @__CSIM_cLine01_rank, align 8
  %78 = icmp uge i64 %76, %77
  br i1 %78, label %79, label %89

; <label>:79                                      ; preds = %75
  %80 = load i64* @__CSIM_cLine00_rank, align 8
  %81 = load i64* @__CSIM_cLine02_rank, align 8
  %82 = icmp uge i64 %80, %81
  br i1 %82, label %83, label %89

; <label>:83                                      ; preds = %79
  %84 = load i64* @__CSIM_cLine00_rank, align 8
  %85 = load i64* @__CSIM_cLine03_rank, align 8
  %86 = icmp uge i64 %84, %85
  br i1 %86, label %87, label %89

; <label>:87                                      ; preds = %83
  store i64 0, i64* @__CSIM_cLine00_rank, align 8
  %88 = load i64* %1, align 8
  store i64 %88, i64* @__CSIM_cLine00_tags, align 8
  br label %518

; <label>:89                                      ; preds = %83, %79, %75
  %90 = load i64* @__CSIM_cLine01_rank, align 8
  %91 = load i64* @__CSIM_cLine00_rank, align 8
  %92 = icmp uge i64 %90, %91
  br i1 %92, label %93, label %103

; <label>:93                                      ; preds = %89
  %94 = load i64* @__CSIM_cLine01_rank, align 8
  %95 = load i64* @__CSIM_cLine02_rank, align 8
  %96 = icmp uge i64 %94, %95
  br i1 %96, label %97, label %103

; <label>:97                                      ; preds = %93
  %98 = load i64* @__CSIM_cLine01_rank, align 8
  %99 = load i64* @__CSIM_cLine03_rank, align 8
  %100 = icmp uge i64 %98, %99
  br i1 %100, label %101, label %103

; <label>:101                                     ; preds = %97
  store i64 0, i64* @__CSIM_cLine01_rank, align 8
  %102 = load i64* %1, align 8
  store i64 %102, i64* @__CSIM_cLine01_tags, align 8
  br label %518

; <label>:103                                     ; preds = %97, %93, %89
  %104 = load i64* @__CSIM_cLine02_rank, align 8
  %105 = load i64* @__CSIM_cLine00_rank, align 8
  %106 = icmp uge i64 %104, %105
  br i1 %106, label %107, label %117

; <label>:107                                     ; preds = %103
  %108 = load i64* @__CSIM_cLine02_rank, align 8
  %109 = load i64* @__CSIM_cLine01_rank, align 8
  %110 = icmp uge i64 %108, %109
  br i1 %110, label %111, label %117

; <label>:111                                     ; preds = %107
  %112 = load i64* @__CSIM_cLine02_rank, align 8
  %113 = load i64* @__CSIM_cLine03_rank, align 8
  %114 = icmp uge i64 %112, %113
  br i1 %114, label %115, label %117

; <label>:115                                     ; preds = %111
  store i64 0, i64* @__CSIM_cLine02_rank, align 8
  %116 = load i64* %1, align 8
  store i64 %116, i64* @__CSIM_cLine02_tags, align 8
  br label %518

; <label>:117                                     ; preds = %111, %107, %103
  %118 = load i64* @__CSIM_cLine03_rank, align 8
  %119 = load i64* @__CSIM_cLine00_rank, align 8
  %120 = icmp uge i64 %118, %119
  br i1 %120, label %121, label %518

; <label>:121                                     ; preds = %117
  %122 = load i64* @__CSIM_cLine03_rank, align 8
  %123 = load i64* @__CSIM_cLine01_rank, align 8
  %124 = icmp uge i64 %122, %123
  br i1 %124, label %125, label %518

; <label>:125                                     ; preds = %121
  %126 = load i64* @__CSIM_cLine03_rank, align 8
  %127 = load i64* @__CSIM_cLine02_rank, align 8
  %128 = icmp uge i64 %126, %127
  br i1 %128, label %129, label %518

; <label>:129                                     ; preds = %125
  store i64 0, i64* @__CSIM_cLine03_rank, align 8
  %130 = load i64* %1, align 8
  store i64 %130, i64* @__CSIM_cLine03_tags, align 8
  br label %518

; <label>:131                                     ; preds = %0
  %132 = load i64* %2, align 8
  %133 = icmp eq i64 %132, 1
  br i1 %133, label %134, label %260

; <label>:134                                     ; preds = %131
  %135 = load i64* @__CSIM_cLine10_rank, align 8
  %136 = add i64 %135, 1
  store i64 %136, i64* @__CSIM_cLine10_rank, align 8
  %137 = load i64* @__CSIM_cLine11_rank, align 8
  %138 = add i64 %137, 1
  store i64 %138, i64* @__CSIM_cLine11_rank, align 8
  %139 = load i64* @__CSIM_cLine12_rank, align 8
  %140 = add i64 %139, 1
  store i64 %140, i64* @__CSIM_cLine12_rank, align 8
  %141 = load i64* @__CSIM_cLine13_rank, align 8
  %142 = add i64 %141, 1
  store i64 %142, i64* @__CSIM_cLine13_rank, align 8
  %143 = load i8* @__CSIM_cLine10_taken, align 1
  %144 = trunc i8 %143 to i1
  br i1 %144, label %145, label %152

; <label>:145                                     ; preds = %134
  %146 = load i64* @__CSIM_cLine10_tags, align 8
  %147 = load i64* %1, align 8
  %148 = icmp eq i64 %146, %147
  br i1 %148, label %149, label %152

; <label>:149                                     ; preds = %145
  %150 = load i32* @__CSIM_num_Load_hit, align 4
  %151 = add i32 %150, 1
  store i32 %151, i32* @__CSIM_num_Load_hit, align 4
  store i64 0, i64* @__CSIM_cLine10_rank, align 8
  store i8 1, i8* @__CSIM_Load_ret, align 1
  br label %518

; <label>:152                                     ; preds = %145, %134
  %153 = load i8* @__CSIM_cLine11_taken, align 1
  %154 = trunc i8 %153 to i1
  br i1 %154, label %155, label %162

; <label>:155                                     ; preds = %152
  %156 = load i64* @__CSIM_cLine11_tags, align 8
  %157 = load i64* %1, align 8
  %158 = icmp eq i64 %156, %157
  br i1 %158, label %159, label %162

; <label>:159                                     ; preds = %155
  %160 = load i32* @__CSIM_num_Load_hit, align 4
  %161 = add i32 %160, 1
  store i32 %161, i32* @__CSIM_num_Load_hit, align 4
  store i64 0, i64* @__CSIM_cLine11_rank, align 8
  store i8 1, i8* @__CSIM_Load_ret, align 1
  br label %518

; <label>:162                                     ; preds = %155, %152
  %163 = load i8* @__CSIM_cLine12_taken, align 1
  %164 = trunc i8 %163 to i1
  br i1 %164, label %165, label %172

; <label>:165                                     ; preds = %162
  %166 = load i64* @__CSIM_cLine12_tags, align 8
  %167 = load i64* %1, align 8
  %168 = icmp eq i64 %166, %167
  br i1 %168, label %169, label %172

; <label>:169                                     ; preds = %165
  %170 = load i32* @__CSIM_num_Load_hit, align 4
  %171 = add i32 %170, 1
  store i32 %171, i32* @__CSIM_num_Load_hit, align 4
  store i64 0, i64* @__CSIM_cLine12_rank, align 8
  store i8 1, i8* @__CSIM_Load_ret, align 1
  br label %518

; <label>:172                                     ; preds = %165, %162
  %173 = load i8* @__CSIM_cLine13_taken, align 1
  %174 = trunc i8 %173 to i1
  br i1 %174, label %175, label %182

; <label>:175                                     ; preds = %172
  %176 = load i64* @__CSIM_cLine13_tags, align 8
  %177 = load i64* %1, align 8
  %178 = icmp eq i64 %176, %177
  br i1 %178, label %179, label %182

; <label>:179                                     ; preds = %175
  %180 = load i32* @__CSIM_num_Load_hit, align 4
  %181 = add i32 %180, 1
  store i32 %181, i32* @__CSIM_num_Load_hit, align 4
  store i64 0, i64* @__CSIM_cLine13_rank, align 8
  store i8 1, i8* @__CSIM_Load_ret, align 1
  br label %518

; <label>:182                                     ; preds = %175, %172
  %183 = load i32* @__CSIM_num_Load_miss, align 4
  %184 = add i32 %183, 1
  store i32 %184, i32* @__CSIM_num_Load_miss, align 4
  store i8 0, i8* @__CSIM_Load_ret, align 1
  %185 = load i8* @__CSIM_cLine10_taken, align 1
  %186 = trunc i8 %185 to i1
  br i1 %186, label %189, label %187

; <label>:187                                     ; preds = %182
  store i8 1, i8* @__CSIM_cLine10_taken, align 1
  %188 = load i64* %1, align 8
  store i64 %188, i64* @__CSIM_cLine10_tags, align 8
  store i64 0, i64* @__CSIM_cLine10_rank, align 8
  br label %518

; <label>:189                                     ; preds = %182
  %190 = load i8* @__CSIM_cLine11_taken, align 1
  %191 = trunc i8 %190 to i1
  br i1 %191, label %194, label %192

; <label>:192                                     ; preds = %189
  store i8 1, i8* @__CSIM_cLine11_taken, align 1
  %193 = load i64* %1, align 8
  store i64 %193, i64* @__CSIM_cLine11_tags, align 8
  store i64 0, i64* @__CSIM_cLine11_rank, align 8
  br label %518

; <label>:194                                     ; preds = %189
  %195 = load i8* @__CSIM_cLine12_taken, align 1
  %196 = trunc i8 %195 to i1
  br i1 %196, label %199, label %197

; <label>:197                                     ; preds = %194
  store i8 1, i8* @__CSIM_cLine12_taken, align 1
  %198 = load i64* %1, align 8
  store i64 %198, i64* @__CSIM_cLine12_tags, align 8
  store i64 0, i64* @__CSIM_cLine12_rank, align 8
  br label %518

; <label>:199                                     ; preds = %194
  %200 = load i8* @__CSIM_cLine13_taken, align 1
  %201 = trunc i8 %200 to i1
  br i1 %201, label %204, label %202

; <label>:202                                     ; preds = %199
  store i8 1, i8* @__CSIM_cLine13_taken, align 1
  %203 = load i64* %1, align 8
  store i64 %203, i64* @__CSIM_cLine13_tags, align 8
  store i64 0, i64* @__CSIM_cLine13_rank, align 8
  br label %518

; <label>:204                                     ; preds = %199
  %205 = load i64* @__CSIM_cLine10_rank, align 8
  %206 = load i64* @__CSIM_cLine11_rank, align 8
  %207 = icmp uge i64 %205, %206
  br i1 %207, label %208, label %218

; <label>:208                                     ; preds = %204
  %209 = load i64* @__CSIM_cLine10_rank, align 8
  %210 = load i64* @__CSIM_cLine12_rank, align 8
  %211 = icmp uge i64 %209, %210
  br i1 %211, label %212, label %218

; <label>:212                                     ; preds = %208
  %213 = load i64* @__CSIM_cLine10_rank, align 8
  %214 = load i64* @__CSIM_cLine13_rank, align 8
  %215 = icmp uge i64 %213, %214
  br i1 %215, label %216, label %218

; <label>:216                                     ; preds = %212
  store i64 0, i64* @__CSIM_cLine10_rank, align 8
  %217 = load i64* %1, align 8
  store i64 %217, i64* @__CSIM_cLine10_tags, align 8
  br label %518

; <label>:218                                     ; preds = %212, %208, %204
  %219 = load i64* @__CSIM_cLine11_rank, align 8
  %220 = load i64* @__CSIM_cLine10_rank, align 8
  %221 = icmp uge i64 %219, %220
  br i1 %221, label %222, label %232

; <label>:222                                     ; preds = %218
  %223 = load i64* @__CSIM_cLine11_rank, align 8
  %224 = load i64* @__CSIM_cLine12_rank, align 8
  %225 = icmp uge i64 %223, %224
  br i1 %225, label %226, label %232

; <label>:226                                     ; preds = %222
  %227 = load i64* @__CSIM_cLine11_rank, align 8
  %228 = load i64* @__CSIM_cLine13_rank, align 8
  %229 = icmp uge i64 %227, %228
  br i1 %229, label %230, label %232

; <label>:230                                     ; preds = %226
  store i64 0, i64* @__CSIM_cLine11_rank, align 8
  %231 = load i64* %1, align 8
  store i64 %231, i64* @__CSIM_cLine11_tags, align 8
  br label %518

; <label>:232                                     ; preds = %226, %222, %218
  %233 = load i64* @__CSIM_cLine12_rank, align 8
  %234 = load i64* @__CSIM_cLine10_rank, align 8
  %235 = icmp uge i64 %233, %234
  br i1 %235, label %236, label %246

; <label>:236                                     ; preds = %232
  %237 = load i64* @__CSIM_cLine12_rank, align 8
  %238 = load i64* @__CSIM_cLine11_rank, align 8
  %239 = icmp uge i64 %237, %238
  br i1 %239, label %240, label %246

; <label>:240                                     ; preds = %236
  %241 = load i64* @__CSIM_cLine12_rank, align 8
  %242 = load i64* @__CSIM_cLine13_rank, align 8
  %243 = icmp uge i64 %241, %242
  br i1 %243, label %244, label %246

; <label>:244                                     ; preds = %240
  store i64 0, i64* @__CSIM_cLine12_rank, align 8
  %245 = load i64* %1, align 8
  store i64 %245, i64* @__CSIM_cLine12_tags, align 8
  br label %518

; <label>:246                                     ; preds = %240, %236, %232
  %247 = load i64* @__CSIM_cLine13_rank, align 8
  %248 = load i64* @__CSIM_cLine10_rank, align 8
  %249 = icmp uge i64 %247, %248
  br i1 %249, label %250, label %518

; <label>:250                                     ; preds = %246
  %251 = load i64* @__CSIM_cLine13_rank, align 8
  %252 = load i64* @__CSIM_cLine11_rank, align 8
  %253 = icmp uge i64 %251, %252
  br i1 %253, label %254, label %518

; <label>:254                                     ; preds = %250
  %255 = load i64* @__CSIM_cLine13_rank, align 8
  %256 = load i64* @__CSIM_cLine12_rank, align 8
  %257 = icmp uge i64 %255, %256
  br i1 %257, label %258, label %518

; <label>:258                                     ; preds = %254
  store i64 0, i64* @__CSIM_cLine13_rank, align 8
  %259 = load i64* %1, align 8
  store i64 %259, i64* @__CSIM_cLine13_tags, align 8
  br label %518

; <label>:260                                     ; preds = %131
  %261 = load i64* %2, align 8
  %262 = icmp eq i64 %261, 2
  br i1 %262, label %263, label %389

; <label>:263                                     ; preds = %260
  %264 = load i64* @__CSIM_cLine20_rank, align 8
  %265 = add i64 %264, 1
  store i64 %265, i64* @__CSIM_cLine20_rank, align 8
  %266 = load i64* @__CSIM_cLine21_rank, align 8
  %267 = add i64 %266, 1
  store i64 %267, i64* @__CSIM_cLine21_rank, align 8
  %268 = load i64* @__CSIM_cLine22_rank, align 8
  %269 = add i64 %268, 1
  store i64 %269, i64* @__CSIM_cLine22_rank, align 8
  %270 = load i64* @__CSIM_cLine23_rank, align 8
  %271 = add i64 %270, 1
  store i64 %271, i64* @__CSIM_cLine23_rank, align 8
  %272 = load i8* @__CSIM_cLine20_taken, align 1
  %273 = trunc i8 %272 to i1
  br i1 %273, label %274, label %281

; <label>:274                                     ; preds = %263
  %275 = load i64* @__CSIM_cLine20_tags, align 8
  %276 = load i64* %1, align 8
  %277 = icmp eq i64 %275, %276
  br i1 %277, label %278, label %281

; <label>:278                                     ; preds = %274
  %279 = load i32* @__CSIM_num_Load_hit, align 4
  %280 = add i32 %279, 1
  store i32 %280, i32* @__CSIM_num_Load_hit, align 4
  store i64 0, i64* @__CSIM_cLine20_rank, align 8
  store i8 1, i8* @__CSIM_Load_ret, align 1
  br label %518

; <label>:281                                     ; preds = %274, %263
  %282 = load i8* @__CSIM_cLine21_taken, align 1
  %283 = trunc i8 %282 to i1
  br i1 %283, label %284, label %291

; <label>:284                                     ; preds = %281
  %285 = load i64* @__CSIM_cLine21_tags, align 8
  %286 = load i64* %1, align 8
  %287 = icmp eq i64 %285, %286
  br i1 %287, label %288, label %291

; <label>:288                                     ; preds = %284
  %289 = load i32* @__CSIM_num_Load_hit, align 4
  %290 = add i32 %289, 1
  store i32 %290, i32* @__CSIM_num_Load_hit, align 4
  store i64 0, i64* @__CSIM_cLine21_rank, align 8
  store i8 1, i8* @__CSIM_Load_ret, align 1
  br label %518

; <label>:291                                     ; preds = %284, %281
  %292 = load i8* @__CSIM_cLine22_taken, align 1
  %293 = trunc i8 %292 to i1
  br i1 %293, label %294, label %301

; <label>:294                                     ; preds = %291
  %295 = load i64* @__CSIM_cLine22_tags, align 8
  %296 = load i64* %1, align 8
  %297 = icmp eq i64 %295, %296
  br i1 %297, label %298, label %301

; <label>:298                                     ; preds = %294
  %299 = load i32* @__CSIM_num_Load_hit, align 4
  %300 = add i32 %299, 1
  store i32 %300, i32* @__CSIM_num_Load_hit, align 4
  store i64 0, i64* @__CSIM_cLine22_rank, align 8
  store i8 1, i8* @__CSIM_Load_ret, align 1
  br label %518

; <label>:301                                     ; preds = %294, %291
  %302 = load i8* @__CSIM_cLine23_taken, align 1
  %303 = trunc i8 %302 to i1
  br i1 %303, label %304, label %311

; <label>:304                                     ; preds = %301
  %305 = load i64* @__CSIM_cLine23_tags, align 8
  %306 = load i64* %1, align 8
  %307 = icmp eq i64 %305, %306
  br i1 %307, label %308, label %311

; <label>:308                                     ; preds = %304
  %309 = load i32* @__CSIM_num_Load_hit, align 4
  %310 = add i32 %309, 1
  store i32 %310, i32* @__CSIM_num_Load_hit, align 4
  store i64 0, i64* @__CSIM_cLine23_rank, align 8
  store i8 1, i8* @__CSIM_Load_ret, align 1
  br label %518

; <label>:311                                     ; preds = %304, %301
  %312 = load i32* @__CSIM_num_Load_miss, align 4
  %313 = add i32 %312, 1
  store i32 %313, i32* @__CSIM_num_Load_miss, align 4
  store i8 0, i8* @__CSIM_Load_ret, align 1
  %314 = load i8* @__CSIM_cLine20_taken, align 1
  %315 = trunc i8 %314 to i1
  br i1 %315, label %318, label %316

; <label>:316                                     ; preds = %311
  store i8 1, i8* @__CSIM_cLine20_taken, align 1
  %317 = load i64* %1, align 8
  store i64 %317, i64* @__CSIM_cLine20_tags, align 8
  store i64 0, i64* @__CSIM_cLine20_rank, align 8
  br label %518

; <label>:318                                     ; preds = %311
  %319 = load i8* @__CSIM_cLine21_taken, align 1
  %320 = trunc i8 %319 to i1
  br i1 %320, label %323, label %321

; <label>:321                                     ; preds = %318
  store i8 1, i8* @__CSIM_cLine21_taken, align 1
  %322 = load i64* %1, align 8
  store i64 %322, i64* @__CSIM_cLine21_tags, align 8
  store i64 0, i64* @__CSIM_cLine21_rank, align 8
  br label %518

; <label>:323                                     ; preds = %318
  %324 = load i8* @__CSIM_cLine22_taken, align 1
  %325 = trunc i8 %324 to i1
  br i1 %325, label %328, label %326

; <label>:326                                     ; preds = %323
  store i8 1, i8* @__CSIM_cLine22_taken, align 1
  %327 = load i64* %1, align 8
  store i64 %327, i64* @__CSIM_cLine22_tags, align 8
  store i64 0, i64* @__CSIM_cLine22_rank, align 8
  br label %518

; <label>:328                                     ; preds = %323
  %329 = load i8* @__CSIM_cLine23_taken, align 1
  %330 = trunc i8 %329 to i1
  br i1 %330, label %333, label %331

; <label>:331                                     ; preds = %328
  store i8 1, i8* @__CSIM_cLine23_taken, align 1
  %332 = load i64* %1, align 8
  store i64 %332, i64* @__CSIM_cLine23_tags, align 8
  store i64 0, i64* @__CSIM_cLine23_rank, align 8
  br label %518

; <label>:333                                     ; preds = %328
  %334 = load i64* @__CSIM_cLine20_rank, align 8
  %335 = load i64* @__CSIM_cLine21_rank, align 8
  %336 = icmp uge i64 %334, %335
  br i1 %336, label %337, label %347

; <label>:337                                     ; preds = %333
  %338 = load i64* @__CSIM_cLine20_rank, align 8
  %339 = load i64* @__CSIM_cLine22_rank, align 8
  %340 = icmp uge i64 %338, %339
  br i1 %340, label %341, label %347

; <label>:341                                     ; preds = %337
  %342 = load i64* @__CSIM_cLine20_rank, align 8
  %343 = load i64* @__CSIM_cLine23_rank, align 8
  %344 = icmp uge i64 %342, %343
  br i1 %344, label %345, label %347

; <label>:345                                     ; preds = %341
  store i64 0, i64* @__CSIM_cLine20_rank, align 8
  %346 = load i64* %1, align 8
  store i64 %346, i64* @__CSIM_cLine20_tags, align 8
  br label %518

; <label>:347                                     ; preds = %341, %337, %333
  %348 = load i64* @__CSIM_cLine21_rank, align 8
  %349 = load i64* @__CSIM_cLine20_rank, align 8
  %350 = icmp uge i64 %348, %349
  br i1 %350, label %351, label %361

; <label>:351                                     ; preds = %347
  %352 = load i64* @__CSIM_cLine21_rank, align 8
  %353 = load i64* @__CSIM_cLine22_rank, align 8
  %354 = icmp uge i64 %352, %353
  br i1 %354, label %355, label %361

; <label>:355                                     ; preds = %351
  %356 = load i64* @__CSIM_cLine21_rank, align 8
  %357 = load i64* @__CSIM_cLine23_rank, align 8
  %358 = icmp uge i64 %356, %357
  br i1 %358, label %359, label %361

; <label>:359                                     ; preds = %355
  store i64 0, i64* @__CSIM_cLine21_rank, align 8
  %360 = load i64* %1, align 8
  store i64 %360, i64* @__CSIM_cLine21_tags, align 8
  br label %518

; <label>:361                                     ; preds = %355, %351, %347
  %362 = load i64* @__CSIM_cLine22_rank, align 8
  %363 = load i64* @__CSIM_cLine20_rank, align 8
  %364 = icmp uge i64 %362, %363
  br i1 %364, label %365, label %375

; <label>:365                                     ; preds = %361
  %366 = load i64* @__CSIM_cLine22_rank, align 8
  %367 = load i64* @__CSIM_cLine21_rank, align 8
  %368 = icmp uge i64 %366, %367
  br i1 %368, label %369, label %375

; <label>:369                                     ; preds = %365
  %370 = load i64* @__CSIM_cLine22_rank, align 8
  %371 = load i64* @__CSIM_cLine23_rank, align 8
  %372 = icmp uge i64 %370, %371
  br i1 %372, label %373, label %375

; <label>:373                                     ; preds = %369
  store i64 0, i64* @__CSIM_cLine22_rank, align 8
  %374 = load i64* %1, align 8
  store i64 %374, i64* @__CSIM_cLine22_tags, align 8
  br label %518

; <label>:375                                     ; preds = %369, %365, %361
  %376 = load i64* @__CSIM_cLine23_rank, align 8
  %377 = load i64* @__CSIM_cLine20_rank, align 8
  %378 = icmp uge i64 %376, %377
  br i1 %378, label %379, label %518

; <label>:379                                     ; preds = %375
  %380 = load i64* @__CSIM_cLine23_rank, align 8
  %381 = load i64* @__CSIM_cLine21_rank, align 8
  %382 = icmp uge i64 %380, %381
  br i1 %382, label %383, label %518

; <label>:383                                     ; preds = %379
  %384 = load i64* @__CSIM_cLine23_rank, align 8
  %385 = load i64* @__CSIM_cLine22_rank, align 8
  %386 = icmp uge i64 %384, %385
  br i1 %386, label %387, label %518

; <label>:387                                     ; preds = %383
  store i64 0, i64* @__CSIM_cLine23_rank, align 8
  %388 = load i64* %1, align 8
  store i64 %388, i64* @__CSIM_cLine23_tags, align 8
  br label %518

; <label>:389                                     ; preds = %260
  %390 = load i64* %2, align 8
  %391 = icmp eq i64 %390, 3
  br i1 %391, label %392, label %518

; <label>:392                                     ; preds = %389
  %393 = load i64* @__CSIM_cLine30_rank, align 8
  %394 = add i64 %393, 1
  store i64 %394, i64* @__CSIM_cLine30_rank, align 8
  %395 = load i64* @__CSIM_cLine31_rank, align 8
  %396 = add i64 %395, 1
  store i64 %396, i64* @__CSIM_cLine31_rank, align 8
  %397 = load i64* @__CSIM_cLine32_rank, align 8
  %398 = add i64 %397, 1
  store i64 %398, i64* @__CSIM_cLine32_rank, align 8
  %399 = load i64* @__CSIM_cLine33_rank, align 8
  %400 = add i64 %399, 1
  store i64 %400, i64* @__CSIM_cLine33_rank, align 8
  %401 = load i8* @__CSIM_cLine30_taken, align 1
  %402 = trunc i8 %401 to i1
  br i1 %402, label %403, label %410

; <label>:403                                     ; preds = %392
  %404 = load i64* @__CSIM_cLine30_tags, align 8
  %405 = load i64* %1, align 8
  %406 = icmp eq i64 %404, %405
  br i1 %406, label %407, label %410

; <label>:407                                     ; preds = %403
  %408 = load i32* @__CSIM_num_Load_hit, align 4
  %409 = add i32 %408, 1
  store i32 %409, i32* @__CSIM_num_Load_hit, align 4
  store i64 0, i64* @__CSIM_cLine30_rank, align 8
  store i8 1, i8* @__CSIM_Load_ret, align 1
  br label %518

; <label>:410                                     ; preds = %403, %392
  %411 = load i8* @__CSIM_cLine31_taken, align 1
  %412 = trunc i8 %411 to i1
  br i1 %412, label %413, label %420

; <label>:413                                     ; preds = %410
  %414 = load i64* @__CSIM_cLine31_tags, align 8
  %415 = load i64* %1, align 8
  %416 = icmp eq i64 %414, %415
  br i1 %416, label %417, label %420

; <label>:417                                     ; preds = %413
  %418 = load i32* @__CSIM_num_Load_hit, align 4
  %419 = add i32 %418, 1
  store i32 %419, i32* @__CSIM_num_Load_hit, align 4
  store i64 0, i64* @__CSIM_cLine31_rank, align 8
  store i8 1, i8* @__CSIM_Load_ret, align 1
  br label %518

; <label>:420                                     ; preds = %413, %410
  %421 = load i8* @__CSIM_cLine32_taken, align 1
  %422 = trunc i8 %421 to i1
  br i1 %422, label %423, label %430

; <label>:423                                     ; preds = %420
  %424 = load i64* @__CSIM_cLine32_tags, align 8
  %425 = load i64* %1, align 8
  %426 = icmp eq i64 %424, %425
  br i1 %426, label %427, label %430

; <label>:427                                     ; preds = %423
  %428 = load i32* @__CSIM_num_Load_hit, align 4
  %429 = add i32 %428, 1
  store i32 %429, i32* @__CSIM_num_Load_hit, align 4
  store i64 0, i64* @__CSIM_cLine32_rank, align 8
  store i8 1, i8* @__CSIM_Load_ret, align 1
  br label %518

; <label>:430                                     ; preds = %423, %420
  %431 = load i8* @__CSIM_cLine33_taken, align 1
  %432 = trunc i8 %431 to i1
  br i1 %432, label %433, label %440

; <label>:433                                     ; preds = %430
  %434 = load i64* @__CSIM_cLine33_tags, align 8
  %435 = load i64* %1, align 8
  %436 = icmp eq i64 %434, %435
  br i1 %436, label %437, label %440

; <label>:437                                     ; preds = %433
  %438 = load i32* @__CSIM_num_Load_hit, align 4
  %439 = add i32 %438, 1
  store i32 %439, i32* @__CSIM_num_Load_hit, align 4
  store i64 0, i64* @__CSIM_cLine33_rank, align 8
  store i8 1, i8* @__CSIM_Load_ret, align 1
  br label %518

; <label>:440                                     ; preds = %433, %430
  %441 = load i32* @__CSIM_num_Load_miss, align 4
  %442 = add i32 %441, 1
  store i32 %442, i32* @__CSIM_num_Load_miss, align 4
  store i8 0, i8* @__CSIM_Load_ret, align 1
  %443 = load i8* @__CSIM_cLine30_taken, align 1
  %444 = trunc i8 %443 to i1
  br i1 %444, label %447, label %445

; <label>:445                                     ; preds = %440
  store i8 1, i8* @__CSIM_cLine30_taken, align 1
  %446 = load i64* %1, align 8
  store i64 %446, i64* @__CSIM_cLine30_tags, align 8
  store i64 0, i64* @__CSIM_cLine30_rank, align 8
  br label %518

; <label>:447                                     ; preds = %440
  %448 = load i8* @__CSIM_cLine31_taken, align 1
  %449 = trunc i8 %448 to i1
  br i1 %449, label %452, label %450

; <label>:450                                     ; preds = %447
  store i8 1, i8* @__CSIM_cLine31_taken, align 1
  %451 = load i64* %1, align 8
  store i64 %451, i64* @__CSIM_cLine31_tags, align 8
  store i64 0, i64* @__CSIM_cLine31_rank, align 8
  br label %518

; <label>:452                                     ; preds = %447
  %453 = load i8* @__CSIM_cLine32_taken, align 1
  %454 = trunc i8 %453 to i1
  br i1 %454, label %457, label %455

; <label>:455                                     ; preds = %452
  store i8 1, i8* @__CSIM_cLine32_taken, align 1
  %456 = load i64* %1, align 8
  store i64 %456, i64* @__CSIM_cLine32_tags, align 8
  store i64 0, i64* @__CSIM_cLine32_rank, align 8
  br label %518

; <label>:457                                     ; preds = %452
  %458 = load i8* @__CSIM_cLine33_taken, align 1
  %459 = trunc i8 %458 to i1
  br i1 %459, label %462, label %460

; <label>:460                                     ; preds = %457
  store i8 1, i8* @__CSIM_cLine33_taken, align 1
  %461 = load i64* %1, align 8
  store i64 %461, i64* @__CSIM_cLine33_tags, align 8
  store i64 0, i64* @__CSIM_cLine33_rank, align 8
  br label %518

; <label>:462                                     ; preds = %457
  %463 = load i64* @__CSIM_cLine30_rank, align 8
  %464 = load i64* @__CSIM_cLine31_rank, align 8
  %465 = icmp uge i64 %463, %464
  br i1 %465, label %466, label %476

; <label>:466                                     ; preds = %462
  %467 = load i64* @__CSIM_cLine30_rank, align 8
  %468 = load i64* @__CSIM_cLine32_rank, align 8
  %469 = icmp uge i64 %467, %468
  br i1 %469, label %470, label %476

; <label>:470                                     ; preds = %466
  %471 = load i64* @__CSIM_cLine30_rank, align 8
  %472 = load i64* @__CSIM_cLine33_rank, align 8
  %473 = icmp uge i64 %471, %472
  br i1 %473, label %474, label %476

; <label>:474                                     ; preds = %470
  store i64 0, i64* @__CSIM_cLine30_rank, align 8
  %475 = load i64* %1, align 8
  store i64 %475, i64* @__CSIM_cLine30_tags, align 8
  br label %518

; <label>:476                                     ; preds = %470, %466, %462
  %477 = load i64* @__CSIM_cLine31_rank, align 8
  %478 = load i64* @__CSIM_cLine30_rank, align 8
  %479 = icmp uge i64 %477, %478
  br i1 %479, label %480, label %490

; <label>:480                                     ; preds = %476
  %481 = load i64* @__CSIM_cLine31_rank, align 8
  %482 = load i64* @__CSIM_cLine32_rank, align 8
  %483 = icmp uge i64 %481, %482
  br i1 %483, label %484, label %490

; <label>:484                                     ; preds = %480
  %485 = load i64* @__CSIM_cLine31_rank, align 8
  %486 = load i64* @__CSIM_cLine33_rank, align 8
  %487 = icmp uge i64 %485, %486
  br i1 %487, label %488, label %490

; <label>:488                                     ; preds = %484
  store i64 0, i64* @__CSIM_cLine31_rank, align 8
  %489 = load i64* %1, align 8
  store i64 %489, i64* @__CSIM_cLine31_tags, align 8
  br label %518

; <label>:490                                     ; preds = %484, %480, %476
  %491 = load i64* @__CSIM_cLine32_rank, align 8
  %492 = load i64* @__CSIM_cLine30_rank, align 8
  %493 = icmp uge i64 %491, %492
  br i1 %493, label %494, label %504

; <label>:494                                     ; preds = %490
  %495 = load i64* @__CSIM_cLine32_rank, align 8
  %496 = load i64* @__CSIM_cLine31_rank, align 8
  %497 = icmp uge i64 %495, %496
  br i1 %497, label %498, label %504

; <label>:498                                     ; preds = %494
  %499 = load i64* @__CSIM_cLine32_rank, align 8
  %500 = load i64* @__CSIM_cLine33_rank, align 8
  %501 = icmp uge i64 %499, %500
  br i1 %501, label %502, label %504

; <label>:502                                     ; preds = %498
  store i64 0, i64* @__CSIM_cLine32_rank, align 8
  %503 = load i64* %1, align 8
  store i64 %503, i64* @__CSIM_cLine32_tags, align 8
  br label %518

; <label>:504                                     ; preds = %498, %494, %490
  %505 = load i64* @__CSIM_cLine33_rank, align 8
  %506 = load i64* @__CSIM_cLine30_rank, align 8
  %507 = icmp uge i64 %505, %506
  br i1 %507, label %508, label %518

; <label>:508                                     ; preds = %504
  %509 = load i64* @__CSIM_cLine33_rank, align 8
  %510 = load i64* @__CSIM_cLine31_rank, align 8
  %511 = icmp uge i64 %509, %510
  br i1 %511, label %512, label %518

; <label>:512                                     ; preds = %508
  %513 = load i64* @__CSIM_cLine33_rank, align 8
  %514 = load i64* @__CSIM_cLine32_rank, align 8
  %515 = icmp uge i64 %513, %514
  br i1 %515, label %516, label %518

; <label>:516                                     ; preds = %512
  store i64 0, i64* @__CSIM_cLine33_rank, align 8
  %517 = load i64* %1, align 8
  store i64 %517, i64* @__CSIM_cLine33_tags, align 8
  br label %518

; <label>:518                                     ; preds = %159, %179, %192, %202, %230, %246, %250, %254, %258, %244, %216, %197, %187, %169, %149, %389, %417, %437, %450, %460, %488, %504, %508, %512, %516, %502, %474, %455, %445, %427, %407, %278, %2
  ret void
}

; Function Attrs: nounwind uwtable
define void @__CSIM_Store(i64 %tags, i64 %set) #0 {
  %1 = alloca i64, align 8
  %2 = alloca i64, align 8
  store i64 %tags, i64* %1, align 8
  store i64 %set, i64* %2, align 8
  %3 = load i64* %2, align 8
  %4 = icmp eq i64 %3, 0
  br i1 %4, label %5, label %131

; <label>:5                                       ; preds = %0
  %6 = load i64* @__CSIM_cLine00_rank, align 8
  %7 = add i64 %6, 1
  store i64 %7, i64* @__CSIM_cLine00_rank, align 8
  %8 = load i64* @__CSIM_cLine01_rank, align 8
  %9 = add i64 %8, 1
  store i64 %9, i64* @__CSIM_cLine01_rank, align 8
  %10 = load i64* @__CSIM_cLine02_rank, align 8
  %11 = add i64 %10, 1
  store i64 %11, i64* @__CSIM_cLine02_rank, align 8
  %12 = load i64* @__CSIM_cLine03_rank, align 8
  %13 = add i64 %12, 1
  store i64 %13, i64* @__CSIM_cLine03_rank, align 8
  %14 = load i8* @__CSIM_cLine00_taken, align 1
  %15 = trunc i8 %14 to i1
  br i1 %15, label %16, label %23

; <label>:16                                      ; preds = %5
  %17 = load i64* @__CSIM_cLine00_tags, align 8
  %18 = load i64* %1, align 8
  %19 = icmp eq i64 %17, %18
  br i1 %19, label %20, label %23

; <label>:20                                      ; preds = %16
  %21 = load i32* @__CSIM_num_Store_hit, align 4
  %22 = add i32 %21, 1
  store i32 %22, i32* @__CSIM_num_Store_hit, align 4
  store i64 0, i64* @__CSIM_cLine00_rank, align 8
  store i8 1, i8* @__CSIM_cLine00_dirty, align 1
  store i8 1, i8* @__CSIM_Store_ret, align 1
  br label %518

; <label>:23                                      ; preds = %16, %5
  %24 = load i8* @__CSIM_cLine01_taken, align 1
  %25 = trunc i8 %24 to i1
  br i1 %25, label %26, label %33

; <label>:26                                      ; preds = %23
  %27 = load i64* @__CSIM_cLine01_tags, align 8
  %28 = load i64* %1, align 8
  %29 = icmp eq i64 %27, %28
  br i1 %29, label %30, label %33

; <label>:30                                      ; preds = %26
  %31 = load i32* @__CSIM_num_Store_hit, align 4
  %32 = add i32 %31, 1
  store i32 %32, i32* @__CSIM_num_Store_hit, align 4
  store i64 0, i64* @__CSIM_cLine01_rank, align 8
  store i8 1, i8* @__CSIM_cLine01_dirty, align 1
  store i8 1, i8* @__CSIM_Store_ret, align 1
  br label %518

; <label>:33                                      ; preds = %26, %23
  %34 = load i8* @__CSIM_cLine02_taken, align 1
  %35 = trunc i8 %34 to i1
  br i1 %35, label %36, label %43

; <label>:36                                      ; preds = %33
  %37 = load i64* @__CSIM_cLine02_tags, align 8
  %38 = load i64* %1, align 8
  %39 = icmp eq i64 %37, %38
  br i1 %39, label %40, label %43

; <label>:40                                      ; preds = %36
  %41 = load i32* @__CSIM_num_Store_hit, align 4
  %42 = add i32 %41, 1
  store i32 %42, i32* @__CSIM_num_Store_hit, align 4
  store i64 0, i64* @__CSIM_cLine02_rank, align 8
  store i8 1, i8* @__CSIM_cLine02_dirty, align 1
  store i8 1, i8* @__CSIM_Store_ret, align 1
  br label %518

; <label>:43                                      ; preds = %36, %33
  %44 = load i8* @__CSIM_cLine03_taken, align 1
  %45 = trunc i8 %44 to i1
  br i1 %45, label %46, label %53

; <label>:46                                      ; preds = %43
  %47 = load i64* @__CSIM_cLine03_tags, align 8
  %48 = load i64* %1, align 8
  %49 = icmp eq i64 %47, %48
  br i1 %49, label %50, label %53

; <label>:50                                      ; preds = %46
  %51 = load i32* @__CSIM_num_Store_hit, align 4
  %52 = add i32 %51, 1
  store i32 %52, i32* @__CSIM_num_Store_hit, align 4
  store i64 0, i64* @__CSIM_cLine03_rank, align 8
  store i8 1, i8* @__CSIM_cLine03_dirty, align 1
  store i8 1, i8* @__CSIM_Store_ret, align 1
  br label %518

; <label>:53                                      ; preds = %46, %43
  %54 = load i32* @__CSIM_num_Store_miss, align 4
  %55 = add i32 %54, 1
  store i32 %55, i32* @__CSIM_num_Store_miss, align 4
  store i8 0, i8* @__CSIM_Store_ret, align 1
  %56 = load i8* @__CSIM_cLine00_taken, align 1
  %57 = trunc i8 %56 to i1
  br i1 %57, label %60, label %58

; <label>:58                                      ; preds = %53
  store i8 1, i8* @__CSIM_cLine00_taken, align 1
  %59 = load i64* %1, align 8
  store i64 %59, i64* @__CSIM_cLine00_tags, align 8
  store i64 0, i64* @__CSIM_cLine00_rank, align 8
  store i8 1, i8* @__CSIM_cLine00_dirty, align 1
  br label %518

; <label>:60                                      ; preds = %53
  %61 = load i8* @__CSIM_cLine01_taken, align 1
  %62 = trunc i8 %61 to i1
  br i1 %62, label %65, label %63

; <label>:63                                      ; preds = %60
  store i8 1, i8* @__CSIM_cLine01_taken, align 1
  %64 = load i64* %1, align 8
  store i64 %64, i64* @__CSIM_cLine01_tags, align 8
  store i64 0, i64* @__CSIM_cLine01_rank, align 8
  store i8 1, i8* @__CSIM_cLine01_dirty, align 1
  br label %518

; <label>:65                                      ; preds = %60
  %66 = load i8* @__CSIM_cLine02_taken, align 1
  %67 = trunc i8 %66 to i1
  br i1 %67, label %70, label %68

; <label>:68                                      ; preds = %65
  store i8 1, i8* @__CSIM_cLine02_taken, align 1
  %69 = load i64* %1, align 8
  store i64 %69, i64* @__CSIM_cLine02_tags, align 8
  store i64 0, i64* @__CSIM_cLine02_rank, align 8
  store i8 1, i8* @__CSIM_cLine02_dirty, align 1
  br label %518

; <label>:70                                      ; preds = %65
  %71 = load i8* @__CSIM_cLine03_taken, align 1
  %72 = trunc i8 %71 to i1
  br i1 %72, label %75, label %73

; <label>:73                                      ; preds = %70
  store i8 1, i8* @__CSIM_cLine03_taken, align 1
  %74 = load i64* %1, align 8
  store i64 %74, i64* @__CSIM_cLine03_tags, align 8
  store i64 0, i64* @__CSIM_cLine03_rank, align 8
  store i8 1, i8* @__CSIM_cLine03_dirty, align 1
  br label %518

; <label>:75                                      ; preds = %70
  %76 = load i64* @__CSIM_cLine00_rank, align 8
  %77 = load i64* @__CSIM_cLine01_rank, align 8
  %78 = icmp uge i64 %76, %77
  br i1 %78, label %79, label %89

; <label>:79                                      ; preds = %75
  %80 = load i64* @__CSIM_cLine00_rank, align 8
  %81 = load i64* @__CSIM_cLine02_rank, align 8
  %82 = icmp uge i64 %80, %81
  br i1 %82, label %83, label %89

; <label>:83                                      ; preds = %79
  %84 = load i64* @__CSIM_cLine00_rank, align 8
  %85 = load i64* @__CSIM_cLine03_rank, align 8
  %86 = icmp uge i64 %84, %85
  br i1 %86, label %87, label %89

; <label>:87                                      ; preds = %83
  store i64 0, i64* @__CSIM_cLine00_rank, align 8
  %88 = load i64* %1, align 8
  store i64 %88, i64* @__CSIM_cLine00_tags, align 8
  store i8 1, i8* @__CSIM_cLine00_dirty, align 1
  br label %518

; <label>:89                                      ; preds = %83, %79, %75
  %90 = load i64* @__CSIM_cLine01_rank, align 8
  %91 = load i64* @__CSIM_cLine00_rank, align 8
  %92 = icmp uge i64 %90, %91
  br i1 %92, label %93, label %103

; <label>:93                                      ; preds = %89
  %94 = load i64* @__CSIM_cLine01_rank, align 8
  %95 = load i64* @__CSIM_cLine02_rank, align 8
  %96 = icmp uge i64 %94, %95
  br i1 %96, label %97, label %103

; <label>:97                                      ; preds = %93
  %98 = load i64* @__CSIM_cLine01_rank, align 8
  %99 = load i64* @__CSIM_cLine03_rank, align 8
  %100 = icmp uge i64 %98, %99
  br i1 %100, label %101, label %103

; <label>:101                                     ; preds = %97
  store i64 0, i64* @__CSIM_cLine01_rank, align 8
  %102 = load i64* %1, align 8
  store i64 %102, i64* @__CSIM_cLine01_tags, align 8
  store i8 1, i8* @__CSIM_cLine01_dirty, align 1
  br label %518

; <label>:103                                     ; preds = %97, %93, %89
  %104 = load i64* @__CSIM_cLine02_rank, align 8
  %105 = load i64* @__CSIM_cLine00_rank, align 8
  %106 = icmp uge i64 %104, %105
  br i1 %106, label %107, label %117

; <label>:107                                     ; preds = %103
  %108 = load i64* @__CSIM_cLine02_rank, align 8
  %109 = load i64* @__CSIM_cLine01_rank, align 8
  %110 = icmp uge i64 %108, %109
  br i1 %110, label %111, label %117

; <label>:111                                     ; preds = %107
  %112 = load i64* @__CSIM_cLine02_rank, align 8
  %113 = load i64* @__CSIM_cLine03_rank, align 8
  %114 = icmp uge i64 %112, %113
  br i1 %114, label %115, label %117

; <label>:115                                     ; preds = %111
  store i64 0, i64* @__CSIM_cLine02_rank, align 8
  %116 = load i64* %1, align 8
  store i64 %116, i64* @__CSIM_cLine02_tags, align 8
  store i8 1, i8* @__CSIM_cLine02_dirty, align 1
  br label %518

; <label>:117                                     ; preds = %111, %107, %103
  %118 = load i64* @__CSIM_cLine03_rank, align 8
  %119 = load i64* @__CSIM_cLine00_rank, align 8
  %120 = icmp uge i64 %118, %119
  br i1 %120, label %121, label %518

; <label>:121                                     ; preds = %117
  %122 = load i64* @__CSIM_cLine03_rank, align 8
  %123 = load i64* @__CSIM_cLine01_rank, align 8
  %124 = icmp uge i64 %122, %123
  br i1 %124, label %125, label %518

; <label>:125                                     ; preds = %121
  %126 = load i64* @__CSIM_cLine03_rank, align 8
  %127 = load i64* @__CSIM_cLine02_rank, align 8
  %128 = icmp uge i64 %126, %127
  br i1 %128, label %129, label %518

; <label>:129                                     ; preds = %125
  store i64 0, i64* @__CSIM_cLine03_rank, align 8
  %130 = load i64* %1, align 8
  store i64 %130, i64* @__CSIM_cLine03_tags, align 8
  store i8 1, i8* @__CSIM_cLine03_dirty, align 1
  br label %518

; <label>:131                                     ; preds = %0
  %132 = load i64* %2, align 8
  %133 = icmp eq i64 %132, 1
  br i1 %133, label %134, label %260

; <label>:134                                     ; preds = %131
  %135 = load i64* @__CSIM_cLine10_rank, align 8
  %136 = add i64 %135, 1
  store i64 %136, i64* @__CSIM_cLine10_rank, align 8
  %137 = load i64* @__CSIM_cLine11_rank, align 8
  %138 = add i64 %137, 1
  store i64 %138, i64* @__CSIM_cLine11_rank, align 8
  %139 = load i64* @__CSIM_cLine12_rank, align 8
  %140 = add i64 %139, 1
  store i64 %140, i64* @__CSIM_cLine12_rank, align 8
  %141 = load i64* @__CSIM_cLine13_rank, align 8
  %142 = add i64 %141, 1
  store i64 %142, i64* @__CSIM_cLine13_rank, align 8
  %143 = load i8* @__CSIM_cLine10_taken, align 1
  %144 = trunc i8 %143 to i1
  br i1 %144, label %145, label %152

; <label>:145                                     ; preds = %134
  %146 = load i64* @__CSIM_cLine10_tags, align 8
  %147 = load i64* %1, align 8
  %148 = icmp eq i64 %146, %147
  br i1 %148, label %149, label %152

; <label>:149                                     ; preds = %145
  %150 = load i32* @__CSIM_num_Store_hit, align 4
  %151 = add i32 %150, 1
  store i32 %151, i32* @__CSIM_num_Store_hit, align 4
  store i64 0, i64* @__CSIM_cLine10_rank, align 8
  store i8 1, i8* @__CSIM_cLine10_dirty, align 1
  store i8 1, i8* @__CSIM_Store_ret, align 1
  br label %518

; <label>:152                                     ; preds = %145, %134
  %153 = load i8* @__CSIM_cLine11_taken, align 1
  %154 = trunc i8 %153 to i1
  br i1 %154, label %155, label %162

; <label>:155                                     ; preds = %152
  %156 = load i64* @__CSIM_cLine11_tags, align 8
  %157 = load i64* %1, align 8
  %158 = icmp eq i64 %156, %157
  br i1 %158, label %159, label %162

; <label>:159                                     ; preds = %155
  %160 = load i32* @__CSIM_num_Store_hit, align 4
  %161 = add i32 %160, 1
  store i32 %161, i32* @__CSIM_num_Store_hit, align 4
  store i64 0, i64* @__CSIM_cLine11_rank, align 8
  store i8 1, i8* @__CSIM_cLine11_dirty, align 1
  store i8 1, i8* @__CSIM_Store_ret, align 1
  br label %518

; <label>:162                                     ; preds = %155, %152
  %163 = load i8* @__CSIM_cLine12_taken, align 1
  %164 = trunc i8 %163 to i1
  br i1 %164, label %165, label %172

; <label>:165                                     ; preds = %162
  %166 = load i64* @__CSIM_cLine12_tags, align 8
  %167 = load i64* %1, align 8
  %168 = icmp eq i64 %166, %167
  br i1 %168, label %169, label %172

; <label>:169                                     ; preds = %165
  %170 = load i32* @__CSIM_num_Store_hit, align 4
  %171 = add i32 %170, 1
  store i32 %171, i32* @__CSIM_num_Store_hit, align 4
  store i64 0, i64* @__CSIM_cLine12_rank, align 8
  store i8 1, i8* @__CSIM_cLine12_dirty, align 1
  store i8 1, i8* @__CSIM_Store_ret, align 1
  br label %518

; <label>:172                                     ; preds = %165, %162
  %173 = load i8* @__CSIM_cLine13_taken, align 1
  %174 = trunc i8 %173 to i1
  br i1 %174, label %175, label %182

; <label>:175                                     ; preds = %172
  %176 = load i64* @__CSIM_cLine13_tags, align 8
  %177 = load i64* %1, align 8
  %178 = icmp eq i64 %176, %177
  br i1 %178, label %179, label %182

; <label>:179                                     ; preds = %175
  %180 = load i32* @__CSIM_num_Store_hit, align 4
  %181 = add i32 %180, 1
  store i32 %181, i32* @__CSIM_num_Store_hit, align 4
  store i64 0, i64* @__CSIM_cLine13_rank, align 8
  store i8 1, i8* @__CSIM_cLine13_dirty, align 1
  store i8 1, i8* @__CSIM_Store_ret, align 1
  br label %518

; <label>:182                                     ; preds = %175, %172
  %183 = load i32* @__CSIM_num_Store_miss, align 4
  %184 = add i32 %183, 1
  store i32 %184, i32* @__CSIM_num_Store_miss, align 4
  store i8 0, i8* @__CSIM_Store_ret, align 1
  %185 = load i8* @__CSIM_cLine10_taken, align 1
  %186 = trunc i8 %185 to i1
  br i1 %186, label %189, label %187

; <label>:187                                     ; preds = %182
  store i8 1, i8* @__CSIM_cLine10_taken, align 1
  %188 = load i64* %1, align 8
  store i64 %188, i64* @__CSIM_cLine10_tags, align 8
  store i64 0, i64* @__CSIM_cLine10_rank, align 8
  store i8 1, i8* @__CSIM_cLine10_dirty, align 1
  br label %518

; <label>:189                                     ; preds = %182
  %190 = load i8* @__CSIM_cLine11_taken, align 1
  %191 = trunc i8 %190 to i1
  br i1 %191, label %194, label %192

; <label>:192                                     ; preds = %189
  store i8 1, i8* @__CSIM_cLine11_taken, align 1
  %193 = load i64* %1, align 8
  store i64 %193, i64* @__CSIM_cLine11_tags, align 8
  store i64 0, i64* @__CSIM_cLine11_rank, align 8
  store i8 1, i8* @__CSIM_cLine11_dirty, align 1
  br label %518

; <label>:194                                     ; preds = %189
  %195 = load i8* @__CSIM_cLine12_taken, align 1
  %196 = trunc i8 %195 to i1
  br i1 %196, label %199, label %197

; <label>:197                                     ; preds = %194
  store i8 1, i8* @__CSIM_cLine12_taken, align 1
  %198 = load i64* %1, align 8
  store i64 %198, i64* @__CSIM_cLine12_tags, align 8
  store i64 0, i64* @__CSIM_cLine12_rank, align 8
  store i8 1, i8* @__CSIM_cLine12_dirty, align 1
  br label %518

; <label>:199                                     ; preds = %194
  %200 = load i8* @__CSIM_cLine13_taken, align 1
  %201 = trunc i8 %200 to i1
  br i1 %201, label %204, label %202

; <label>:202                                     ; preds = %199
  store i8 1, i8* @__CSIM_cLine13_taken, align 1
  %203 = load i64* %1, align 8
  store i64 %203, i64* @__CSIM_cLine13_tags, align 8
  store i64 0, i64* @__CSIM_cLine13_rank, align 8
  store i8 1, i8* @__CSIM_cLine13_dirty, align 1
  br label %518

; <label>:204                                     ; preds = %199
  %205 = load i64* @__CSIM_cLine10_rank, align 8
  %206 = load i64* @__CSIM_cLine11_rank, align 8
  %207 = icmp uge i64 %205, %206
  br i1 %207, label %208, label %218

; <label>:208                                     ; preds = %204
  %209 = load i64* @__CSIM_cLine10_rank, align 8
  %210 = load i64* @__CSIM_cLine12_rank, align 8
  %211 = icmp uge i64 %209, %210
  br i1 %211, label %212, label %218

; <label>:212                                     ; preds = %208
  %213 = load i64* @__CSIM_cLine10_rank, align 8
  %214 = load i64* @__CSIM_cLine13_rank, align 8
  %215 = icmp uge i64 %213, %214
  br i1 %215, label %216, label %218

; <label>:216                                     ; preds = %212
  store i64 0, i64* @__CSIM_cLine10_rank, align 8
  %217 = load i64* %1, align 8
  store i64 %217, i64* @__CSIM_cLine10_tags, align 8
  store i8 1, i8* @__CSIM_cLine10_dirty, align 1
  br label %518

; <label>:218                                     ; preds = %212, %208, %204
  %219 = load i64* @__CSIM_cLine11_rank, align 8
  %220 = load i64* @__CSIM_cLine10_rank, align 8
  %221 = icmp uge i64 %219, %220
  br i1 %221, label %222, label %232

; <label>:222                                     ; preds = %218
  %223 = load i64* @__CSIM_cLine11_rank, align 8
  %224 = load i64* @__CSIM_cLine12_rank, align 8
  %225 = icmp uge i64 %223, %224
  br i1 %225, label %226, label %232

; <label>:226                                     ; preds = %222
  %227 = load i64* @__CSIM_cLine11_rank, align 8
  %228 = load i64* @__CSIM_cLine13_rank, align 8
  %229 = icmp uge i64 %227, %228
  br i1 %229, label %230, label %232

; <label>:230                                     ; preds = %226
  store i64 0, i64* @__CSIM_cLine11_rank, align 8
  %231 = load i64* %1, align 8
  store i64 %231, i64* @__CSIM_cLine11_tags, align 8
  store i8 1, i8* @__CSIM_cLine11_dirty, align 1
  br label %518

; <label>:232                                     ; preds = %226, %222, %218
  %233 = load i64* @__CSIM_cLine12_rank, align 8
  %234 = load i64* @__CSIM_cLine10_rank, align 8
  %235 = icmp uge i64 %233, %234
  br i1 %235, label %236, label %246

; <label>:236                                     ; preds = %232
  %237 = load i64* @__CSIM_cLine12_rank, align 8
  %238 = load i64* @__CSIM_cLine11_rank, align 8
  %239 = icmp uge i64 %237, %238
  br i1 %239, label %240, label %246

; <label>:240                                     ; preds = %236
  %241 = load i64* @__CSIM_cLine12_rank, align 8
  %242 = load i64* @__CSIM_cLine13_rank, align 8
  %243 = icmp uge i64 %241, %242
  br i1 %243, label %244, label %246

; <label>:244                                     ; preds = %240
  store i64 0, i64* @__CSIM_cLine12_rank, align 8
  %245 = load i64* %1, align 8
  store i64 %245, i64* @__CSIM_cLine12_tags, align 8
  store i8 1, i8* @__CSIM_cLine12_dirty, align 1
  br label %518

; <label>:246                                     ; preds = %240, %236, %232
  %247 = load i64* @__CSIM_cLine13_rank, align 8
  %248 = load i64* @__CSIM_cLine10_rank, align 8
  %249 = icmp uge i64 %247, %248
  br i1 %249, label %250, label %518

; <label>:250                                     ; preds = %246
  %251 = load i64* @__CSIM_cLine13_rank, align 8
  %252 = load i64* @__CSIM_cLine11_rank, align 8
  %253 = icmp uge i64 %251, %252
  br i1 %253, label %254, label %518

; <label>:254                                     ; preds = %250
  %255 = load i64* @__CSIM_cLine13_rank, align 8
  %256 = load i64* @__CSIM_cLine12_rank, align 8
  %257 = icmp uge i64 %255, %256
  br i1 %257, label %258, label %518

; <label>:258                                     ; preds = %254
  store i64 0, i64* @__CSIM_cLine13_rank, align 8
  %259 = load i64* %1, align 8
  store i64 %259, i64* @__CSIM_cLine13_tags, align 8
  store i8 1, i8* @__CSIM_cLine13_dirty, align 1
  br label %518

; <label>:260                                     ; preds = %131
  %261 = load i64* %2, align 8
  %262 = icmp eq i64 %261, 2
  br i1 %262, label %263, label %389

; <label>:263                                     ; preds = %260
  %264 = load i64* @__CSIM_cLine20_rank, align 8
  %265 = add i64 %264, 1
  store i64 %265, i64* @__CSIM_cLine20_rank, align 8
  %266 = load i64* @__CSIM_cLine21_rank, align 8
  %267 = add i64 %266, 1
  store i64 %267, i64* @__CSIM_cLine21_rank, align 8
  %268 = load i64* @__CSIM_cLine22_rank, align 8
  %269 = add i64 %268, 1
  store i64 %269, i64* @__CSIM_cLine22_rank, align 8
  %270 = load i64* @__CSIM_cLine23_rank, align 8
  %271 = add i64 %270, 1
  store i64 %271, i64* @__CSIM_cLine23_rank, align 8
  %272 = load i8* @__CSIM_cLine20_taken, align 1
  %273 = trunc i8 %272 to i1
  br i1 %273, label %274, label %281

; <label>:274                                     ; preds = %263
  %275 = load i64* @__CSIM_cLine20_tags, align 8
  %276 = load i64* %1, align 8
  %277 = icmp eq i64 %275, %276
  br i1 %277, label %278, label %281

; <label>:278                                     ; preds = %274
  %279 = load i32* @__CSIM_num_Store_hit, align 4
  %280 = add i32 %279, 1
  store i32 %280, i32* @__CSIM_num_Store_hit, align 4
  store i64 0, i64* @__CSIM_cLine20_rank, align 8
  store i8 1, i8* @__CSIM_cLine20_dirty, align 1
  store i8 1, i8* @__CSIM_Store_ret, align 1
  br label %518

; <label>:281                                     ; preds = %274, %263
  %282 = load i8* @__CSIM_cLine21_taken, align 1
  %283 = trunc i8 %282 to i1
  br i1 %283, label %284, label %291

; <label>:284                                     ; preds = %281
  %285 = load i64* @__CSIM_cLine21_tags, align 8
  %286 = load i64* %1, align 8
  %287 = icmp eq i64 %285, %286
  br i1 %287, label %288, label %291

; <label>:288                                     ; preds = %284
  %289 = load i32* @__CSIM_num_Store_hit, align 4
  %290 = add i32 %289, 1
  store i32 %290, i32* @__CSIM_num_Store_hit, align 4
  store i64 0, i64* @__CSIM_cLine21_rank, align 8
  store i8 1, i8* @__CSIM_cLine21_dirty, align 1
  store i8 1, i8* @__CSIM_Store_ret, align 1
  br label %518

; <label>:291                                     ; preds = %284, %281
  %292 = load i8* @__CSIM_cLine22_taken, align 1
  %293 = trunc i8 %292 to i1
  br i1 %293, label %294, label %301

; <label>:294                                     ; preds = %291
  %295 = load i64* @__CSIM_cLine22_tags, align 8
  %296 = load i64* %1, align 8
  %297 = icmp eq i64 %295, %296
  br i1 %297, label %298, label %301

; <label>:298                                     ; preds = %294
  %299 = load i32* @__CSIM_num_Store_hit, align 4
  %300 = add i32 %299, 1
  store i32 %300, i32* @__CSIM_num_Store_hit, align 4
  store i64 0, i64* @__CSIM_cLine22_rank, align 8
  store i8 1, i8* @__CSIM_cLine22_dirty, align 1
  store i8 1, i8* @__CSIM_Store_ret, align 1
  br label %518

; <label>:301                                     ; preds = %294, %291
  %302 = load i8* @__CSIM_cLine23_taken, align 1
  %303 = trunc i8 %302 to i1
  br i1 %303, label %304, label %311

; <label>:304                                     ; preds = %301
  %305 = load i64* @__CSIM_cLine23_tags, align 8
  %306 = load i64* %1, align 8
  %307 = icmp eq i64 %305, %306
  br i1 %307, label %308, label %311

; <label>:308                                     ; preds = %304
  %309 = load i32* @__CSIM_num_Store_hit, align 4
  %310 = add i32 %309, 1
  store i32 %310, i32* @__CSIM_num_Store_hit, align 4
  store i64 0, i64* @__CSIM_cLine23_rank, align 8
  store i8 1, i8* @__CSIM_cLine23_dirty, align 1
  store i8 1, i8* @__CSIM_Store_ret, align 1
  br label %518

; <label>:311                                     ; preds = %304, %301
  %312 = load i32* @__CSIM_num_Store_miss, align 4
  %313 = add i32 %312, 1
  store i32 %313, i32* @__CSIM_num_Store_miss, align 4
  store i8 0, i8* @__CSIM_Store_ret, align 1
  %314 = load i8* @__CSIM_cLine20_taken, align 1
  %315 = trunc i8 %314 to i1
  br i1 %315, label %318, label %316

; <label>:316                                     ; preds = %311
  store i8 1, i8* @__CSIM_cLine20_taken, align 1
  %317 = load i64* %1, align 8
  store i64 %317, i64* @__CSIM_cLine20_tags, align 8
  store i64 0, i64* @__CSIM_cLine20_rank, align 8
  store i8 1, i8* @__CSIM_cLine20_dirty, align 1
  br label %518

; <label>:318                                     ; preds = %311
  %319 = load i8* @__CSIM_cLine21_taken, align 1
  %320 = trunc i8 %319 to i1
  br i1 %320, label %323, label %321

; <label>:321                                     ; preds = %318
  store i8 1, i8* @__CSIM_cLine21_taken, align 1
  %322 = load i64* %1, align 8
  store i64 %322, i64* @__CSIM_cLine21_tags, align 8
  store i64 0, i64* @__CSIM_cLine21_rank, align 8
  store i8 1, i8* @__CSIM_cLine21_dirty, align 1
  br label %518

; <label>:323                                     ; preds = %318
  %324 = load i8* @__CSIM_cLine22_taken, align 1
  %325 = trunc i8 %324 to i1
  br i1 %325, label %328, label %326

; <label>:326                                     ; preds = %323
  store i8 1, i8* @__CSIM_cLine22_taken, align 1
  %327 = load i64* %1, align 8
  store i64 %327, i64* @__CSIM_cLine22_tags, align 8
  store i64 0, i64* @__CSIM_cLine22_rank, align 8
  store i8 1, i8* @__CSIM_cLine22_dirty, align 1
  br label %518

; <label>:328                                     ; preds = %323
  %329 = load i8* @__CSIM_cLine23_taken, align 1
  %330 = trunc i8 %329 to i1
  br i1 %330, label %333, label %331

; <label>:331                                     ; preds = %328
  store i8 1, i8* @__CSIM_cLine23_taken, align 1
  %332 = load i64* %1, align 8
  store i64 %332, i64* @__CSIM_cLine23_tags, align 8
  store i64 0, i64* @__CSIM_cLine23_rank, align 8
  store i8 1, i8* @__CSIM_cLine23_dirty, align 1
  br label %518

; <label>:333                                     ; preds = %328
  %334 = load i64* @__CSIM_cLine20_rank, align 8
  %335 = load i64* @__CSIM_cLine21_rank, align 8
  %336 = icmp uge i64 %334, %335
  br i1 %336, label %337, label %347

; <label>:337                                     ; preds = %333
  %338 = load i64* @__CSIM_cLine20_rank, align 8
  %339 = load i64* @__CSIM_cLine22_rank, align 8
  %340 = icmp uge i64 %338, %339
  br i1 %340, label %341, label %347

; <label>:341                                     ; preds = %337
  %342 = load i64* @__CSIM_cLine20_rank, align 8
  %343 = load i64* @__CSIM_cLine23_rank, align 8
  %344 = icmp uge i64 %342, %343
  br i1 %344, label %345, label %347

; <label>:345                                     ; preds = %341
  store i64 0, i64* @__CSIM_cLine20_rank, align 8
  %346 = load i64* %1, align 8
  store i64 %346, i64* @__CSIM_cLine20_tags, align 8
  store i8 1, i8* @__CSIM_cLine20_dirty, align 1
  br label %518

; <label>:347                                     ; preds = %341, %337, %333
  %348 = load i64* @__CSIM_cLine21_rank, align 8
  %349 = load i64* @__CSIM_cLine20_rank, align 8
  %350 = icmp uge i64 %348, %349
  br i1 %350, label %351, label %361

; <label>:351                                     ; preds = %347
  %352 = load i64* @__CSIM_cLine21_rank, align 8
  %353 = load i64* @__CSIM_cLine22_rank, align 8
  %354 = icmp uge i64 %352, %353
  br i1 %354, label %355, label %361

; <label>:355                                     ; preds = %351
  %356 = load i64* @__CSIM_cLine21_rank, align 8
  %357 = load i64* @__CSIM_cLine23_rank, align 8
  %358 = icmp uge i64 %356, %357
  br i1 %358, label %359, label %361

; <label>:359                                     ; preds = %355
  store i64 0, i64* @__CSIM_cLine21_rank, align 8
  %360 = load i64* %1, align 8
  store i64 %360, i64* @__CSIM_cLine21_tags, align 8
  store i8 1, i8* @__CSIM_cLine21_dirty, align 1
  br label %518

; <label>:361                                     ; preds = %355, %351, %347
  %362 = load i64* @__CSIM_cLine22_rank, align 8
  %363 = load i64* @__CSIM_cLine20_rank, align 8
  %364 = icmp uge i64 %362, %363
  br i1 %364, label %365, label %375

; <label>:365                                     ; preds = %361
  %366 = load i64* @__CSIM_cLine22_rank, align 8
  %367 = load i64* @__CSIM_cLine21_rank, align 8
  %368 = icmp uge i64 %366, %367
  br i1 %368, label %369, label %375

; <label>:369                                     ; preds = %365
  %370 = load i64* @__CSIM_cLine22_rank, align 8
  %371 = load i64* @__CSIM_cLine23_rank, align 8
  %372 = icmp uge i64 %370, %371
  br i1 %372, label %373, label %375

; <label>:373                                     ; preds = %369
  store i64 0, i64* @__CSIM_cLine22_rank, align 8
  %374 = load i64* %1, align 8
  store i64 %374, i64* @__CSIM_cLine22_tags, align 8
  store i8 1, i8* @__CSIM_cLine22_dirty, align 1
  br label %518

; <label>:375                                     ; preds = %369, %365, %361
  %376 = load i64* @__CSIM_cLine23_rank, align 8
  %377 = load i64* @__CSIM_cLine20_rank, align 8
  %378 = icmp uge i64 %376, %377
  br i1 %378, label %379, label %518

; <label>:379                                     ; preds = %375
  %380 = load i64* @__CSIM_cLine23_rank, align 8
  %381 = load i64* @__CSIM_cLine21_rank, align 8
  %382 = icmp uge i64 %380, %381
  br i1 %382, label %383, label %518

; <label>:383                                     ; preds = %379
  %384 = load i64* @__CSIM_cLine23_rank, align 8
  %385 = load i64* @__CSIM_cLine22_rank, align 8
  %386 = icmp uge i64 %384, %385
  br i1 %386, label %387, label %518

; <label>:387                                     ; preds = %383
  store i64 0, i64* @__CSIM_cLine23_rank, align 8
  %388 = load i64* %1, align 8
  store i64 %388, i64* @__CSIM_cLine23_tags, align 8
  store i8 1, i8* @__CSIM_cLine23_dirty, align 1
  br label %518

; <label>:389                                     ; preds = %260
  %390 = load i64* %2, align 8
  %391 = icmp eq i64 %390, 3
  br i1 %391, label %392, label %518

; <label>:392                                     ; preds = %389
  %393 = load i64* @__CSIM_cLine30_rank, align 8
  %394 = add i64 %393, 1
  store i64 %394, i64* @__CSIM_cLine30_rank, align 8
  %395 = load i64* @__CSIM_cLine31_rank, align 8
  %396 = add i64 %395, 1
  store i64 %396, i64* @__CSIM_cLine31_rank, align 8
  %397 = load i64* @__CSIM_cLine32_rank, align 8
  %398 = add i64 %397, 1
  store i64 %398, i64* @__CSIM_cLine32_rank, align 8
  %399 = load i64* @__CSIM_cLine33_rank, align 8
  %400 = add i64 %399, 1
  store i64 %400, i64* @__CSIM_cLine33_rank, align 8
  %401 = load i8* @__CSIM_cLine30_taken, align 1
  %402 = trunc i8 %401 to i1
  br i1 %402, label %403, label %410

; <label>:403                                     ; preds = %392
  %404 = load i64* @__CSIM_cLine30_tags, align 8
  %405 = load i64* %1, align 8
  %406 = icmp eq i64 %404, %405
  br i1 %406, label %407, label %410

; <label>:407                                     ; preds = %403
  %408 = load i32* @__CSIM_num_Store_hit, align 4
  %409 = add i32 %408, 1
  store i32 %409, i32* @__CSIM_num_Store_hit, align 4
  store i64 0, i64* @__CSIM_cLine30_rank, align 8
  store i8 1, i8* @__CSIM_cLine30_dirty, align 1
  store i8 1, i8* @__CSIM_Store_ret, align 1
  br label %518

; <label>:410                                     ; preds = %403, %392
  %411 = load i8* @__CSIM_cLine31_taken, align 1
  %412 = trunc i8 %411 to i1
  br i1 %412, label %413, label %420

; <label>:413                                     ; preds = %410
  %414 = load i64* @__CSIM_cLine31_tags, align 8
  %415 = load i64* %1, align 8
  %416 = icmp eq i64 %414, %415
  br i1 %416, label %417, label %420

; <label>:417                                     ; preds = %413
  %418 = load i32* @__CSIM_num_Store_hit, align 4
  %419 = add i32 %418, 1
  store i32 %419, i32* @__CSIM_num_Store_hit, align 4
  store i64 0, i64* @__CSIM_cLine31_rank, align 8
  store i8 1, i8* @__CSIM_cLine31_dirty, align 1
  store i8 1, i8* @__CSIM_Store_ret, align 1
  br label %518

; <label>:420                                     ; preds = %413, %410
  %421 = load i8* @__CSIM_cLine32_taken, align 1
  %422 = trunc i8 %421 to i1
  br i1 %422, label %423, label %430

; <label>:423                                     ; preds = %420
  %424 = load i64* @__CSIM_cLine32_tags, align 8
  %425 = load i64* %1, align 8
  %426 = icmp eq i64 %424, %425
  br i1 %426, label %427, label %430

; <label>:427                                     ; preds = %423
  %428 = load i32* @__CSIM_num_Store_hit, align 4
  %429 = add i32 %428, 1
  store i32 %429, i32* @__CSIM_num_Store_hit, align 4
  store i64 0, i64* @__CSIM_cLine32_rank, align 8
  store i8 1, i8* @__CSIM_cLine32_dirty, align 1
  store i8 1, i8* @__CSIM_Store_ret, align 1
  br label %518

; <label>:430                                     ; preds = %423, %420
  %431 = load i8* @__CSIM_cLine33_taken, align 1
  %432 = trunc i8 %431 to i1
  br i1 %432, label %433, label %440

; <label>:433                                     ; preds = %430
  %434 = load i64* @__CSIM_cLine33_tags, align 8
  %435 = load i64* %1, align 8
  %436 = icmp eq i64 %434, %435
  br i1 %436, label %437, label %440

; <label>:437                                     ; preds = %433
  %438 = load i32* @__CSIM_num_Store_hit, align 4
  %439 = add i32 %438, 1
  store i32 %439, i32* @__CSIM_num_Store_hit, align 4
  store i64 0, i64* @__CSIM_cLine33_rank, align 8
  store i8 1, i8* @__CSIM_cLine33_dirty, align 1
  store i8 1, i8* @__CSIM_Store_ret, align 1
  br label %518

; <label>:440                                     ; preds = %433, %430
  %441 = load i32* @__CSIM_num_Store_miss, align 4
  %442 = add i32 %441, 1
  store i32 %442, i32* @__CSIM_num_Store_miss, align 4
  store i8 0, i8* @__CSIM_Store_ret, align 1
  %443 = load i8* @__CSIM_cLine30_taken, align 1
  %444 = trunc i8 %443 to i1
  br i1 %444, label %447, label %445

; <label>:445                                     ; preds = %440
  store i8 1, i8* @__CSIM_cLine30_taken, align 1
  %446 = load i64* %1, align 8
  store i64 %446, i64* @__CSIM_cLine30_tags, align 8
  store i64 0, i64* @__CSIM_cLine30_rank, align 8
  store i8 1, i8* @__CSIM_cLine30_dirty, align 1
  br label %518

; <label>:447                                     ; preds = %440
  %448 = load i8* @__CSIM_cLine31_taken, align 1
  %449 = trunc i8 %448 to i1
  br i1 %449, label %452, label %450

; <label>:450                                     ; preds = %447
  store i8 1, i8* @__CSIM_cLine31_taken, align 1
  %451 = load i64* %1, align 8
  store i64 %451, i64* @__CSIM_cLine31_tags, align 8
  store i64 0, i64* @__CSIM_cLine31_rank, align 8
  store i8 1, i8* @__CSIM_cLine31_dirty, align 1
  br label %518

; <label>:452                                     ; preds = %447
  %453 = load i8* @__CSIM_cLine32_taken, align 1
  %454 = trunc i8 %453 to i1
  br i1 %454, label %457, label %455

; <label>:455                                     ; preds = %452
  store i8 1, i8* @__CSIM_cLine32_taken, align 1
  %456 = load i64* %1, align 8
  store i64 %456, i64* @__CSIM_cLine32_tags, align 8
  store i64 0, i64* @__CSIM_cLine32_rank, align 8
  store i8 1, i8* @__CSIM_cLine32_dirty, align 1
  br label %518

; <label>:457                                     ; preds = %452
  %458 = load i8* @__CSIM_cLine33_taken, align 1
  %459 = trunc i8 %458 to i1
  br i1 %459, label %462, label %460

; <label>:460                                     ; preds = %457
  store i8 1, i8* @__CSIM_cLine33_taken, align 1
  %461 = load i64* %1, align 8
  store i64 %461, i64* @__CSIM_cLine33_tags, align 8
  store i64 0, i64* @__CSIM_cLine33_rank, align 8
  store i8 1, i8* @__CSIM_cLine33_dirty, align 1
  br label %518

; <label>:462                                     ; preds = %457
  %463 = load i64* @__CSIM_cLine30_rank, align 8
  %464 = load i64* @__CSIM_cLine31_rank, align 8
  %465 = icmp uge i64 %463, %464
  br i1 %465, label %466, label %476

; <label>:466                                     ; preds = %462
  %467 = load i64* @__CSIM_cLine30_rank, align 8
  %468 = load i64* @__CSIM_cLine32_rank, align 8
  %469 = icmp uge i64 %467, %468
  br i1 %469, label %470, label %476

; <label>:470                                     ; preds = %466
  %471 = load i64* @__CSIM_cLine30_rank, align 8
  %472 = load i64* @__CSIM_cLine33_rank, align 8
  %473 = icmp uge i64 %471, %472
  br i1 %473, label %474, label %476

; <label>:474                                     ; preds = %470
  store i64 0, i64* @__CSIM_cLine30_rank, align 8
  %475 = load i64* %1, align 8
  store i64 %475, i64* @__CSIM_cLine30_tags, align 8
  store i8 1, i8* @__CSIM_cLine30_dirty, align 1
  br label %518

; <label>:476                                     ; preds = %470, %466, %462
  %477 = load i64* @__CSIM_cLine31_rank, align 8
  %478 = load i64* @__CSIM_cLine30_rank, align 8
  %479 = icmp uge i64 %477, %478
  br i1 %479, label %480, label %490

; <label>:480                                     ; preds = %476
  %481 = load i64* @__CSIM_cLine31_rank, align 8
  %482 = load i64* @__CSIM_cLine32_rank, align 8
  %483 = icmp uge i64 %481, %482
  br i1 %483, label %484, label %490

; <label>:484                                     ; preds = %480
  %485 = load i64* @__CSIM_cLine31_rank, align 8
  %486 = load i64* @__CSIM_cLine33_rank, align 8
  %487 = icmp uge i64 %485, %486
  br i1 %487, label %488, label %490

; <label>:488                                     ; preds = %484
  store i64 0, i64* @__CSIM_cLine31_rank, align 8
  %489 = load i64* %1, align 8
  store i64 %489, i64* @__CSIM_cLine31_tags, align 8
  store i8 1, i8* @__CSIM_cLine31_dirty, align 1
  br label %518

; <label>:490                                     ; preds = %484, %480, %476
  %491 = load i64* @__CSIM_cLine32_rank, align 8
  %492 = load i64* @__CSIM_cLine30_rank, align 8
  %493 = icmp uge i64 %491, %492
  br i1 %493, label %494, label %504

; <label>:494                                     ; preds = %490
  %495 = load i64* @__CSIM_cLine32_rank, align 8
  %496 = load i64* @__CSIM_cLine31_rank, align 8
  %497 = icmp uge i64 %495, %496
  br i1 %497, label %498, label %504

; <label>:498                                     ; preds = %494
  %499 = load i64* @__CSIM_cLine32_rank, align 8
  %500 = load i64* @__CSIM_cLine33_rank, align 8
  %501 = icmp uge i64 %499, %500
  br i1 %501, label %502, label %504

; <label>:502                                     ; preds = %498
  store i64 0, i64* @__CSIM_cLine32_rank, align 8
  %503 = load i64* %1, align 8
  store i64 %503, i64* @__CSIM_cLine32_tags, align 8
  store i8 1, i8* @__CSIM_cLine32_dirty, align 1
  br label %518

; <label>:504                                     ; preds = %498, %494, %490
  %505 = load i64* @__CSIM_cLine33_rank, align 8
  %506 = load i64* @__CSIM_cLine30_rank, align 8
  %507 = icmp uge i64 %505, %506
  br i1 %507, label %508, label %518

; <label>:508                                     ; preds = %504
  %509 = load i64* @__CSIM_cLine33_rank, align 8
  %510 = load i64* @__CSIM_cLine31_rank, align 8
  %511 = icmp uge i64 %509, %510
  br i1 %511, label %512, label %518

; <label>:512                                     ; preds = %508
  %513 = load i64* @__CSIM_cLine33_rank, align 8
  %514 = load i64* @__CSIM_cLine32_rank, align 8
  %515 = icmp uge i64 %513, %514
  br i1 %515, label %516, label %518

; <label>:516                                     ; preds = %512
  store i64 0, i64* @__CSIM_cLine33_rank, align 8
  %517 = load i64* %1, align 8
  store i64 %517, i64* @__CSIM_cLine33_tags, align 8
  store i8 1, i8* @__CSIM_cLine33_dirty, align 1
  br label %518

; <label>:518                                     ; preds = %159, %179, %192, %202, %230, %246, %250, %254, %258, %244, %216, %197, %187, %169, %149, %389, %417, %437, %450, %460, %488, %504, %508, %512, %516, %502, %474, %455, %445, %427, %407, %278, %2
  ret void
}

; Function Attrs: nounwind uwtable
define void @__CSIM_print_stat() #0 {
  %1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([37 x i8]* @.str4, i32 0, i32 0))
  %2 = load i32* @__CSIM_num_Load_hit, align 4
  %3 = load i32* @__CSIM_num_Load_miss, align 4
  %4 = add i32 %2, %3
  %5 = load i32* @__CSIM_num_Store_hit, align 4
  %6 = add i32 %4, %5
  %7 = load i32* @__CSIM_num_Store_miss, align 4
  %8 = add i32 %6, %7
  %9 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str5, i32 0, i32 0), i32 %8)
  %10 = load i32* @__CSIM_num_Load_hit, align 4
  %11 = load i32* @__CSIM_num_Load_miss, align 4
  %12 = add i32 %10, %11
  %13 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([24 x i8]* @.str6, i32 0, i32 0), i32 %12)
  %14 = load i32* @__CSIM_num_Load_hit, align 4
  %15 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str7, i32 0, i32 0), i32 %14)
  %16 = load i32* @__CSIM_num_Load_miss, align 4
  %17 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str8, i32 0, i32 0), i32 %16)
  %18 = load i32* @__CSIM_num_Store_hit, align 4
  %19 = load i32* @__CSIM_num_Store_miss, align 4
  %20 = add i32 %18, %19
  %21 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([24 x i8]* @.str9, i32 0, i32 0), i32 %20)
  %22 = load i32* @__CSIM_num_Store_hit, align 4
  %23 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str10, i32 0, i32 0), i32 %22)
  %24 = load i32* @__CSIM_num_Store_miss, align 4
  %25 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([27 x i8]* @.str11, i32 0, i32 0), i32 %24)
  ret void
}

; Function Attrs: nounwind uwtable
define void @__CSIM_MAIN__(i32 %tmp) #0 {
CH_STB:
  %0 = alloca i32, align 4
  store i32 %tmp, i32* %0, align 4
  %1 = load i32* %0, align 4
  store i32 %1, i32* @multi, align 64
  call void @__CSIM_Store(i64 24585, i64 2)
  store i32 0, i32* @i, align 64
  call void @__CSIM_Store(i64 24589, i64 0)
  br label %CH_LDB2

CH_LDB2:                                          ; preds = %CH_LDB7, %CH_STB
  %2 = load i32* @i, align 64
  call void @__CSIM_Load(i64 24589, i64 0)
  %3 = icmp slt i32 %2, 12
  br i1 %3, label %CH_LDB3, label %16

CH_LDB3:                                          ; preds = %CH_LDB2
  %4 = load i32* @i, align 64
  call void @__CSIM_Load(i64 24589, i64 0)
  %int_cast_to_i64 = zext i32 3 to i64
  call void @klee_div_zero_check(i64 %int_cast_to_i64)
  %5 = srem i32 %4, 3
  %6 = icmp eq i32 %5, 0
  %7 = load i32* @i, align 64
  call void @__CSIM_Load(i64 24589, i64 0)
  br i1 %6, label %CH_LDB4, label %CH_LDB5

CH_LDB4:                                          ; preds = %CH_LDB3
  %8 = sext i32 %7 to i64
  %9 = getelementptr inbounds [200 x i32]* @a, i32 0, i64 %8
  store i32 42, i32* %9, align 4
  %CH_OFFSET = mul i64 4, %8
  %CH_LEFT = add i64 %CH_OFFSET, 6293952
  %CH_COND = icmp ult i64 %CH_LEFT, 6294016
  br i1 %CH_COND, label %CH_TRUE_BLOCK, label %CH_ELSE_BLOCK

CH_LDB5:                                          ; preds = %CH_LDB3
  %10 = load i32* @multi, align 64
  call void @__CSIM_Load(i64 24585, i64 2)
  %11 = add nsw i32 %7, %10
  %12 = sext i32 %11 to i64
  %13 = getelementptr inbounds [200 x i32]* @a, i32 0, i64 %12
  store i32 42, i32* %13, align 4
  %CH_OFFSET67 = mul i64 4, %12
  %CH_LEFT68 = add i64 %CH_OFFSET67, 6293952
  %CH_COND69 = icmp ult i64 %CH_LEFT68, 6294016
  br i1 %CH_COND69, label %CH_TRUE_BLOCK74, label %CH_ELSE_BLOCK70

CH_LDB7:                                          ; preds = %CH_TRUE_BLOCK130, %CH_TRUE_BLOCK129, %CH_ELSE_BLOCK125, %CH_TRUE_BLOCK124, %CH_TRUE_BLOCK119, %CH_TRUE_BLOCK114, %CH_TRUE_BLOCK109, %CH_TRUE_BLOCK104, %CH_TRUE_BLOCK99, %CH_TRUE_BLOCK94, %CH_TR
  %14 = load i32* @i, align 64
  call void @__CSIM_Load(i64 24589, i64 0)
  %15 = add nsw i32 %14, 1
  store i32 %15, i32* @i, align 64
  call void @__CSIM_Store(i64 24589, i64 0)
  br label %CH_LDB2

; <label>:16                                      ; preds = %CH_LDB2
  ret void

CH_ELSE_BLOCK:                                    ; preds = %CH_LDB4
  %CH_OFFSET8 = mul i64 4, %8
  %CH_LEFT9 = add i64 %CH_OFFSET8, 6293952
  %CH_COND10 = icmp ult i64 %CH_LEFT9, 6294080
  br i1 %CH_COND10, label %CH_TRUE_BLOCK15, label %CH_ELSE_BLOCK11

CH_TRUE_BLOCK:                                    ; preds = %CH_LDB4
  call void @__CSIM_Store(i64 24585, i64 3)
  br label %CH_LDB7

CH_ELSE_BLOCK11:                                  ; preds = %CH_ELSE_BLOCK
  %CH_OFFSET12 = mul i64 4, %8
  %CH_LEFT13 = add i64 %CH_OFFSET12, 6293952
  %CH_COND14 = icmp ult i64 %CH_LEFT13, 6294144
  br i1 %CH_COND14, label %CH_TRUE_BLOCK20, label %CH_ELSE_BLOCK16

CH_TRUE_BLOCK15:                                  ; preds = %CH_ELSE_BLOCK
  call void @__CSIM_Store(i64 24586, i64 0)
  br label %CH_LDB7

CH_ELSE_BLOCK16:                                  ; preds = %CH_ELSE_BLOCK11
  %CH_OFFSET17 = mul i64 4, %8
  %CH_LEFT18 = add i64 %CH_OFFSET17, 6293952
  %CH_COND19 = icmp ult i64 %CH_LEFT18, 6294208
  br i1 %CH_COND19, label %CH_TRUE_BLOCK25, label %CH_ELSE_BLOCK21

CH_TRUE_BLOCK20:                                  ; preds = %CH_ELSE_BLOCK11
  call void @__CSIM_Store(i64 24586, i64 1)
  br label %CH_LDB7

CH_ELSE_BLOCK21:                                  ; preds = %CH_ELSE_BLOCK16
  %CH_OFFSET22 = mul i64 4, %8
  %CH_LEFT23 = add i64 %CH_OFFSET22, 6293952
  %CH_COND24 = icmp ult i64 %CH_LEFT23, 6294272
  br i1 %CH_COND24, label %CH_TRUE_BLOCK30, label %CH_ELSE_BLOCK26

CH_TRUE_BLOCK25:                                  ; preds = %CH_ELSE_BLOCK16
  call void @__CSIM_Store(i64 24586, i64 2)
  br label %CH_LDB7

CH_ELSE_BLOCK26:                                  ; preds = %CH_ELSE_BLOCK21
  %CH_OFFSET27 = mul i64 4, %8
  %CH_LEFT28 = add i64 %CH_OFFSET27, 6293952
  %CH_COND29 = icmp ult i64 %CH_LEFT28, 6294336
  br i1 %CH_COND29, label %CH_TRUE_BLOCK35, label %CH_ELSE_BLOCK31

CH_TRUE_BLOCK30:                                  ; preds = %CH_ELSE_BLOCK21
  call void @__CSIM_Store(i64 24586, i64 3)
  br label %CH_LDB7

CH_ELSE_BLOCK31:                                  ; preds = %CH_ELSE_BLOCK26
  %CH_OFFSET32 = mul i64 4, %8
  %CH_LEFT33 = add i64 %CH_OFFSET32, 6293952
  %CH_COND34 = icmp ult i64 %CH_LEFT33, 6294400
  br i1 %CH_COND34, label %CH_TRUE_BLOCK40, label %CH_ELSE_BLOCK36

CH_TRUE_BLOCK35:                                  ; preds = %CH_ELSE_BLOCK26
  call void @__CSIM_Store(i64 24587, i64 0)
  br label %CH_LDB7

CH_ELSE_BLOCK36:                                  ; preds = %CH_ELSE_BLOCK31
  %CH_OFFSET37 = mul i64 4, %8
  %CH_LEFT38 = add i64 %CH_OFFSET37, 6293952
  %CH_COND39 = icmp ult i64 %CH_LEFT38, 6294464
  br i1 %CH_COND39, label %CH_TRUE_BLOCK45, label %CH_ELSE_BLOCK41

CH_TRUE_BLOCK40:                                  ; preds = %CH_ELSE_BLOCK31
  call void @__CSIM_Store(i64 24587, i64 1)
  br label %CH_LDB7

CH_ELSE_BLOCK41:                                  ; preds = %CH_ELSE_BLOCK36
  %CH_OFFSET42 = mul i64 4, %8
  %CH_LEFT43 = add i64 %CH_OFFSET42, 6293952
  %CH_COND44 = icmp ult i64 %CH_LEFT43, 6294528
  br i1 %CH_COND44, label %CH_TRUE_BLOCK50, label %CH_ELSE_BLOCK46

CH_TRUE_BLOCK45:                                  ; preds = %CH_ELSE_BLOCK36
  call void @__CSIM_Store(i64 24587, i64 2)
  br label %CH_LDB7

CH_ELSE_BLOCK46:                                  ; preds = %CH_ELSE_BLOCK41
  %CH_OFFSET47 = mul i64 4, %8
  %CH_LEFT48 = add i64 %CH_OFFSET47, 6293952
  %CH_COND49 = icmp ult i64 %CH_LEFT48, 6294592
  br i1 %CH_COND49, label %CH_TRUE_BLOCK55, label %CH_ELSE_BLOCK51

CH_TRUE_BLOCK50:                                  ; preds = %CH_ELSE_BLOCK41
  call void @__CSIM_Store(i64 24587, i64 3)
  br label %CH_LDB7

CH_ELSE_BLOCK51:                                  ; preds = %CH_ELSE_BLOCK46
  %CH_OFFSET52 = mul i64 4, %8
  %CH_LEFT53 = add i64 %CH_OFFSET52, 6293952
  %CH_COND54 = icmp ult i64 %CH_LEFT53, 6294656
  br i1 %CH_COND54, label %CH_TRUE_BLOCK60, label %CH_ELSE_BLOCK56

CH_TRUE_BLOCK55:                                  ; preds = %CH_ELSE_BLOCK46
  call void @__CSIM_Store(i64 24588, i64 0)
  br label %CH_LDB7

CH_ELSE_BLOCK56:                                  ; preds = %CH_ELSE_BLOCK51
  %CH_OFFSET57 = mul i64 4, %8
  %CH_LEFT58 = add i64 %CH_OFFSET57, 6293952
  %CH_COND59 = icmp ult i64 %CH_LEFT58, 6294720
  br i1 %CH_COND59, label %CH_TRUE_BLOCK65, label %CH_ELSE_BLOCK61

CH_TRUE_BLOCK60:                                  ; preds = %CH_ELSE_BLOCK51
  call void @__CSIM_Store(i64 24588, i64 1)
  br label %CH_LDB7

CH_ELSE_BLOCK61:                                  ; preds = %CH_ELSE_BLOCK56
  %CH_OFFSET62 = mul i64 4, %8
  %CH_LEFT63 = add i64 %CH_OFFSET62, 6293952
  %CH_COND64 = icmp ult i64 %CH_LEFT63, 6294752
  br i1 %CH_COND64, label %CH_TRUE_BLOCK66, label %CH_LDB7

CH_TRUE_BLOCK65:                                  ; preds = %CH_ELSE_BLOCK56
  call void @__CSIM_Store(i64 24588, i64 2)
  br label %CH_LDB7

CH_TRUE_BLOCK66:                                  ; preds = %CH_ELSE_BLOCK61
  call void @__CSIM_Store(i64 24588, i64 3)
  br label %CH_LDB7

CH_ELSE_BLOCK70:                                  ; preds = %CH_LDB5
  %CH_OFFSET71 = mul i64 4, %12
  %CH_LEFT72 = add i64 %CH_OFFSET71, 6293952
  %CH_COND73 = icmp ult i64 %CH_LEFT72, 6294080
  br i1 %CH_COND73, label %CH_TRUE_BLOCK79, label %CH_ELSE_BLOCK75

CH_TRUE_BLOCK74:                                  ; preds = %CH_LDB5
  call void @__CSIM_Store(i64 24585, i64 3)
  br label %CH_LDB7

CH_ELSE_BLOCK75:                                  ; preds = %CH_ELSE_BLOCK70
  %CH_OFFSET76 = mul i64 4, %12
  %CH_LEFT77 = add i64 %CH_OFFSET76, 6293952
  %CH_COND78 = icmp ult i64 %CH_LEFT77, 6294144
  br i1 %CH_COND78, label %CH_TRUE_BLOCK84, label %CH_ELSE_BLOCK80

CH_TRUE_BLOCK79:                                  ; preds = %CH_ELSE_BLOCK70
  call void @__CSIM_Store(i64 24586, i64 0)
  br label %CH_LDB7

CH_ELSE_BLOCK80:                                  ; preds = %CH_ELSE_BLOCK75
  %CH_OFFSET81 = mul i64 4, %12
  %CH_LEFT82 = add i64 %CH_OFFSET81, 6293952
  %CH_COND83 = icmp ult i64 %CH_LEFT82, 6294208
  br i1 %CH_COND83, label %CH_TRUE_BLOCK89, label %CH_ELSE_BLOCK85

CH_TRUE_BLOCK84:                                  ; preds = %CH_ELSE_BLOCK75
  call void @__CSIM_Store(i64 24586, i64 1)
  br label %CH_LDB7

CH_ELSE_BLOCK85:                                  ; preds = %CH_ELSE_BLOCK80
  %CH_OFFSET86 = mul i64 4, %12
  %CH_LEFT87 = add i64 %CH_OFFSET86, 6293952
  %CH_COND88 = icmp ult i64 %CH_LEFT87, 6294272
  br i1 %CH_COND88, label %CH_TRUE_BLOCK94, label %CH_ELSE_BLOCK90

CH_TRUE_BLOCK89:                                  ; preds = %CH_ELSE_BLOCK80
  call void @__CSIM_Store(i64 24586, i64 2)
  br label %CH_LDB7

CH_ELSE_BLOCK90:                                  ; preds = %CH_ELSE_BLOCK85
  %CH_OFFSET91 = mul i64 4, %12
  %CH_LEFT92 = add i64 %CH_OFFSET91, 6293952
  %CH_COND93 = icmp ult i64 %CH_LEFT92, 6294336
  br i1 %CH_COND93, label %CH_TRUE_BLOCK99, label %CH_ELSE_BLOCK95

CH_TRUE_BLOCK94:                                  ; preds = %CH_ELSE_BLOCK85
  call void @__CSIM_Store(i64 24586, i64 3)
  br label %CH_LDB7

CH_ELSE_BLOCK95:                                  ; preds = %CH_ELSE_BLOCK90
  %CH_OFFSET96 = mul i64 4, %12
  %CH_LEFT97 = add i64 %CH_OFFSET96, 6293952
  %CH_COND98 = icmp ult i64 %CH_LEFT97, 6294400
  br i1 %CH_COND98, label %CH_TRUE_BLOCK104, label %CH_ELSE_BLOCK100

CH_TRUE_BLOCK99:                                  ; preds = %CH_ELSE_BLOCK90
  call void @__CSIM_Store(i64 24587, i64 0)
  br label %CH_LDB7

CH_ELSE_BLOCK100:                                 ; preds = %CH_ELSE_BLOCK95
  %CH_OFFSET101 = mul i64 4, %12
  %CH_LEFT102 = add i64 %CH_OFFSET101, 6293952
  %CH_COND103 = icmp ult i64 %CH_LEFT102, 6294464
  br i1 %CH_COND103, label %CH_TRUE_BLOCK109, label %CH_ELSE_BLOCK105

CH_TRUE_BLOCK104:                                 ; preds = %CH_ELSE_BLOCK95
  call void @__CSIM_Store(i64 24587, i64 1)
  br label %CH_LDB7

CH_ELSE_BLOCK105:                                 ; preds = %CH_ELSE_BLOCK100
  %CH_OFFSET106 = mul i64 4, %12
  %CH_LEFT107 = add i64 %CH_OFFSET106, 6293952
  %CH_COND108 = icmp ult i64 %CH_LEFT107, 6294528
  br i1 %CH_COND108, label %CH_TRUE_BLOCK114, label %CH_ELSE_BLOCK110

CH_TRUE_BLOCK109:                                 ; preds = %CH_ELSE_BLOCK100
  call void @__CSIM_Store(i64 24587, i64 2)
  br label %CH_LDB7

CH_ELSE_BLOCK110:                                 ; preds = %CH_ELSE_BLOCK105
  %CH_OFFSET111 = mul i64 4, %12
  %CH_LEFT112 = add i64 %CH_OFFSET111, 6293952
  %CH_COND113 = icmp ult i64 %CH_LEFT112, 6294592
  br i1 %CH_COND113, label %CH_TRUE_BLOCK119, label %CH_ELSE_BLOCK115

CH_TRUE_BLOCK114:                                 ; preds = %CH_ELSE_BLOCK105
  call void @__CSIM_Store(i64 24587, i64 3)
  br label %CH_LDB7

CH_ELSE_BLOCK115:                                 ; preds = %CH_ELSE_BLOCK110
  %CH_OFFSET116 = mul i64 4, %12
  %CH_LEFT117 = add i64 %CH_OFFSET116, 6293952
  %CH_COND118 = icmp ult i64 %CH_LEFT117, 6294656
  br i1 %CH_COND118, label %CH_TRUE_BLOCK124, label %CH_ELSE_BLOCK120

CH_TRUE_BLOCK119:                                 ; preds = %CH_ELSE_BLOCK110
  call void @__CSIM_Store(i64 24588, i64 0)
  br label %CH_LDB7

CH_ELSE_BLOCK120:                                 ; preds = %CH_ELSE_BLOCK115
  %CH_OFFSET121 = mul i64 4, %12
  %CH_LEFT122 = add i64 %CH_OFFSET121, 6293952
  %CH_COND123 = icmp ult i64 %CH_LEFT122, 6294720
  br i1 %CH_COND123, label %CH_TRUE_BLOCK129, label %CH_ELSE_BLOCK125

CH_TRUE_BLOCK124:                                 ; preds = %CH_ELSE_BLOCK115
  call void @__CSIM_Store(i64 24588, i64 1)
  br label %CH_LDB7

CH_ELSE_BLOCK125:                                 ; preds = %CH_ELSE_BLOCK120
  %CH_OFFSET126 = mul i64 4, %12
  %CH_LEFT127 = add i64 %CH_OFFSET126, 6293952
  %CH_COND128 = icmp ult i64 %CH_LEFT127, 6294752
  br i1 %CH_COND128, label %CH_TRUE_BLOCK130, label %CH_LDB7

CH_TRUE_BLOCK129:                                 ; preds = %CH_ELSE_BLOCK120
  call void @__CSIM_Store(i64 24588, i64 2)
  br label %CH_LDB7

CH_TRUE_BLOCK130:                                 ; preds = %CH_ELSE_BLOCK125
  call void @__CSIM_Store(i64 24588, i64 3)
  br label %CH_LDB7
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %access1 = alloca i32, align 4
  %writemiss1 = alloca i32, align 4
  %access2 = alloca i32, align 4
  %writemiss2 = alloca i32, align 4
  store i32 0, i32* %1
  %2 = bitcast i32* %a to i8*
  call void @klee_make_symbolic(i8* %2, i64 4, i8* getelementptr inbounds ([2 x i8]* @.str12, i32 0, i32 0))
  %3 = bitcast i32* %b to i8*
  call void @klee_make_symbolic(i8* %3, i64 4, i8* getelementptr inbounds ([2 x i8]* @.str13, i32 0, i32 0))
  %4 = load i32* %a, align 4
  %5 = load i32* %b, align 4
  %6 = icmp ne i32 %4, %5
  %7 = zext i1 %6 to i32
  %8 = sext i32 %7 to i64
  call void @klee_assume(i64 %8)
  %9 = load i32* %a, align 4
  %10 = icmp slt i32 %9, 11
  %11 = zext i1 %10 to i32
  %12 = sext i32 %11 to i64
  call void @klee_assume(i64 %12)
  %13 = load i32* %a, align 4
  %14 = icmp sge i32 %13, 0
  %15 = zext i1 %14 to i32
  %16 = sext i32 %15 to i64
  call void @klee_assume(i64 %16)
  %17 = load i32* %b, align 4
  %18 = icmp slt i32 %17, 11
  %19 = zext i1 %18 to i32
  %20 = sext i32 %19 to i64
  call void @klee_assume(i64 %20)
  %21 = load i32* %b, align 4
  %22 = icmp sge i32 %21, 0
  %23 = zext i1 %22 to i32
  %24 = sext i32 %23 to i64
  call void @klee_assume(i64 %24)
  call void @__CSIM_init_cache()
  %25 = load i32* %a, align 4
  call void @__CSIM_MAIN__(i32 %25)
  %26 = load i32* @__CSIM_num_Store_hit, align 4
  %27 = load i32* @__CSIM_num_Store_miss, align 4
  %28 = add i32 %26, %27
  %29 = load i32* @__CSIM_num_Load_hit, align 4
  %30 = add i32 %28, %29
  %31 = load i32* @__CSIM_num_Load_miss, align 4
  %32 = add i32 %30, %31
  store i32 %32, i32* %access1, align 4
  %33 = load i32* @__CSIM_num_Store_miss, align 4
  store i32 %33, i32* %writemiss1, align 4
  call void @__CSIM_init_cache()
  %34 = load i32* %b, align 4
  call void @__CSIM_MAIN__(i32 %34)
  %35 = load i32* @__CSIM_num_Store_hit, align 4
  %36 = load i32* @__CSIM_num_Store_miss, align 4
  %37 = add i32 %35, %36
  %38 = load i32* @__CSIM_num_Load_hit, align 4
  %39 = add i32 %37, %38
  %40 = load i32* @__CSIM_num_Load_miss, align 4
  %41 = add i32 %39, %40
  store i32 %41, i32* %access2, align 4
  %42 = load i32* @__CSIM_num_Store_miss, align 4
  store i32 %42, i32* %writemiss2, align 4
  %43 = load i32* %access1, align 4
  %44 = load i32* %access2, align 4
  %45 = icmp eq i32 %43, %44
  br i1 %45, label %47, label %46

; <label>:46                                      ; preds = %0
  call void @__assert_fail(i8* getelementptr inbounds ([19 x i8]* @.str14, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8]* @.str15, i32 0, i32 0), i32 61, i8* getelementptr inbounds ([11 x i8]* @__PRETTY_FUNCTION__.main, i32 0, i32 0)) #5
  unreachable

; <label>:47                                      ; preds = %0
  %48 = load i32* %writemiss1, align 4
  %49 = load i32* %writemiss2, align 4
  %50 = icmp eq i32 %48, %49
  br i1 %50, label %52, label %51

; <label>:51                                      ; preds = %47
  call void @__assert_fail(i8* getelementptr inbounds ([25 x i8]* @.str16, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8]* @.str15, i32 0, i32 0), i32 62, i8* getelementptr inbounds ([11 x i8]* @__PRETTY_FUNCTION__.main, i32 0, i32 0)) #5
  unreachable

; <label>:52                                      ; preds = %47
  ret i32 0
}

declare void @klee_make_symbolic(i8*, i64, i8*) #1

declare void @klee_assume(i64) #1

; Function Attrs: noreturn nounwind
declare void @__assert_fail(i8*, i8*, i32, i8*) #2

; Function Attrs: nounwind uwtable
define i64 @klee_choose(i64 %n) #3 {
  %x = alloca i64, align 8
  %1 = bitcast i64* %x to i8*
  call void @klee_make_symbolic(i8* %1, i64 8, i8* getelementptr inbounds ([12 x i8]* @.str17, i64 0, i64 0)) #6
  %2 = load i64* %x, align 8, !tbaa !1
  %3 = icmp ult i64 %2, %n
  br i1 %3, label %5, label %4

; <label>:4                                       ; preds = %0
  call void @klee_silent_exit(i32 0) #7
  unreachable

; <label>:5                                       ; preds = %0
  ret i64 %2
}

; Function Attrs: noreturn
declare void @klee_silent_exit(i32) #4

; Function Attrs: nounwind uwtable
define void @klee_div_zero_check(i64 %z) #3 {
  %1 = icmp eq i64 %z, 0
  br i1 %1, label %2, label %3

; <label>:2                                       ; preds = %0
  tail call void @klee_report_error(i8* getelementptr inbounds ([57 x i8]* @.str118, i64 0, i64 0), i32 14, i8* getelementptr inbounds ([15 x i8]* @.str1219, i64 0, i64 0), i8* getelementptr inbounds ([8 x i8]* @.str220, i64 0, i64 0)) #7
  unreachable

; <label>:3                                       ; preds = %0
  ret void
}

; Function Attrs: noreturn
declare void @klee_report_error(i8*, i32, i8*, i8*) #4

; Function Attrs: nounwind uwtable
define i32 @klee_int(i8* %name) #3 {
  %x = alloca i32, align 4
  %1 = bitcast i32* %x to i8*
  call void @klee_make_symbolic(i8* %1, i64 4, i8* %name) #6
  %2 = load i32* %x, align 4, !tbaa !5
  ret i32 %2
}

; Function Attrs: nounwind uwtable
define void @klee_overshift_check(i64 %bitWidth, i64 %shift) #3 {
  %1 = icmp ult i64 %shift, %bitWidth
  br i1 %1, label %3, label %2

; <label>:2                                       ; preds = %0
  tail call void @klee_report_error(i8* getelementptr inbounds ([8 x i8]* @.str321, i64 0, i64 0), i32 0, i8* getelementptr inbounds ([16 x i8]* @.str1422, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8]* @.str25, i64 0, i64 0)) #7
  unreachable

; <label>:3                                       ; preds = %0
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @klee_range(i32 %start, i32 %end, i8* %name) #3 {
  %x = alloca i32, align 4
  %1 = icmp slt i32 %start, %end
  br i1 %1, label %3, label %2

; <label>:2                                       ; preds = %0
  call void @klee_report_error(i8* getelementptr inbounds ([48 x i8]* @.str623, i64 0, i64 0), i32 17, i8* getelementptr inbounds ([14 x i8]* @.str1724, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8]* @.str28, i64 0, i64 0)) #7
  unreachable

; <label>:3                                       ; preds = %0
  %4 = add nsw i32 %start, 1
  %5 = icmp eq i32 %4, %end
  br i1 %5, label %21, label %6

; <label>:6                                       ; preds = %3
  %7 = bitcast i32* %x to i8*
  call void @klee_make_symbolic(i8* %7, i64 4, i8* %name) #6
  %8 = icmp eq i32 %start, 0
  %9 = load i32* %x, align 4, !tbaa !5
  br i1 %8, label %10, label %13

; <label>:10                                      ; preds = %6
  %11 = icmp ult i32 %9, %end
  %12 = zext i1 %11 to i64
  call void @klee_assume(i64 %12) #6
  br label %19

; <label>:13                                      ; preds = %6
  %14 = icmp sge i32 %9, %start
  %15 = zext i1 %14 to i64
  call void @klee_assume(i64 %15) #6
  %16 = load i32* %x, align 4, !tbaa !5
  %17 = icmp slt i32 %16, %end
  %18 = zext i1 %17 to i64
  call void @klee_assume(i64 %18) #6
  br label %19

; <label>:19                                      ; preds = %13, %10
  %20 = load i32* %x, align 4, !tbaa !5
  br label %21

; <label>:21                                      ; preds = %19, %3
  %.0 = phi i32 [ %20, %19 ], [ %start, %3 ]
  ret i32 %.0
}

; Function Attrs: nounwind uwtable
define weak i8* @memcpy(i8* %destaddr, i8* %srcaddr, i64 %len) #3 {
  %1 = icmp eq i64 %len, 0
  br i1 %1, label %._crit_edge, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %0
  %n.vec = and i64 %len, -32
  %cmp.zero = icmp eq i64 %n.vec, 0
  %2 = add i64 %len, -1
  br i1 %cmp.zero, label %middle.block, label %vector.memcheck

vector.memcheck:                                  ; preds = %.lr.ph.preheader
  %scevgep4 = getelementptr i8* %srcaddr, i64 %2
  %scevgep = getelementptr i8* %destaddr, i64 %2
  %bound1 = icmp uge i8* %scevgep, %srcaddr
  %bound0 = icmp uge i8* %scevgep4, %destaddr
  %memcheck.conflict = and i1 %bound0, %bound1
  %ptr.ind.end = getelementptr i8* %srcaddr, i64 %n.vec
  %ptr.ind.end6 = getelementptr i8* %destaddr, i64 %n.vec
  %rev.ind.end = sub i64 %len, %n.vec
  br i1 %memcheck.conflict, label %middle.block, label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.memcheck
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.memcheck ]
  %next.gep = getelementptr i8* %srcaddr, i64 %index
  %next.gep103 = getelementptr i8* %destaddr, i64 %index
  %3 = bitcast i8* %next.gep to <16 x i8>*
  %wide.load = load <16 x i8>* %3, align 1
  %next.gep.sum279 = or i64 %index, 16
  %4 = getelementptr i8* %srcaddr, i64 %next.gep.sum279
  %5 = bitcast i8* %4 to <16 x i8>*
  %wide.load200 = load <16 x i8>* %5, align 1
  %6 = bitcast i8* %next.gep103 to <16 x i8>*
  store <16 x i8> %wide.load, <16 x i8>* %6, align 1
  %next.gep103.sum296 = or i64 %index, 16
  %7 = getelementptr i8* %destaddr, i64 %next.gep103.sum296
  %8 = bitcast i8* %7 to <16 x i8>*
  store <16 x i8> %wide.load200, <16 x i8>* %8, align 1
  %index.next = add i64 %index, 32
  %9 = icmp eq i64 %index.next, %n.vec
  br i1 %9, label %middle.block, label %vector.body, !llvm.loop !7

middle.block:                                     ; preds = %vector.body, %vector.memcheck, %.lr.ph.preheader
  %resume.val = phi i8* [ %srcaddr, %.lr.ph.preheader ], [ %srcaddr, %vector.memcheck ], [ %ptr.ind.end, %vector.body ]
  %resume.val5 = phi i8* [ %destaddr, %.lr.ph.preheader ], [ %destaddr, %vector.memcheck ], [ %ptr.ind.end6, %vector.body ]
  %resume.val7 = phi i64 [ %len, %.lr.ph.preheader ], [ %len, %vector.memcheck ], [ %rev.ind.end, %vector.body ]
  %new.indc.resume.val = phi i64 [ 0, %.lr.ph.preheader ], [ 0, %vector.memcheck ], [ %n.vec, %vector.body ]
  %cmp.n = icmp eq i64 %new.indc.resume.val, %len
  br i1 %cmp.n, label %._crit_edge, label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph, %middle.block
  %src.03 = phi i8* [ %11, %.lr.ph ], [ %resume.val, %middle.block ]
  %dest.02 = phi i8* [ %13, %.lr.ph ], [ %resume.val5, %middle.block ]
  %.01 = phi i64 [ %10, %.lr.ph ], [ %resume.val7, %middle.block ]
  %10 = add i64 %.01, -1
  %11 = getelementptr inbounds i8* %src.03, i64 1
  %12 = load i8* %src.03, align 1, !tbaa !10
  %13 = getelementptr inbounds i8* %dest.02, i64 1
  store i8 %12, i8* %dest.02, align 1, !tbaa !10
  %14 = icmp eq i64 %10, 0
  br i1 %14, label %._crit_edge, label %.lr.ph, !llvm.loop !11

._crit_edge:                                      ; preds = %.lr.ph, %middle.block, %0
  ret i8* %destaddr
}

; Function Attrs: nounwind uwtable
define weak i8* @memmove(i8* %dst, i8* %src, i64 %count) #3 {
  %1 = icmp eq i8* %src, %dst
  br i1 %1, label %.loopexit, label %2

; <label>:2                                       ; preds = %0
  %3 = icmp ugt i8* %src, %dst
  br i1 %3, label %.preheader, label %18

.preheader:                                       ; preds = %2
  %4 = icmp eq i64 %count, 0
  br i1 %4, label %.loopexit, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %.preheader
  %n.vec = and i64 %count, -32
  %cmp.zero = icmp eq i64 %n.vec, 0
  %5 = add i64 %count, -1
  br i1 %cmp.zero, label %middle.block, label %vector.memcheck

vector.memcheck:                                  ; preds = %.lr.ph.preheader
  %scevgep11 = getelementptr i8* %src, i64 %5
  %scevgep = getelementptr i8* %dst, i64 %5
  %bound1 = icmp uge i8* %scevgep, %src
  %bound0 = icmp uge i8* %scevgep11, %dst
  %memcheck.conflict = and i1 %bound0, %bound1
  %ptr.ind.end = getelementptr i8* %src, i64 %n.vec
  %ptr.ind.end13 = getelementptr i8* %dst, i64 %n.vec
  %rev.ind.end = sub i64 %count, %n.vec
  br i1 %memcheck.conflict, label %middle.block, label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.memcheck
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.memcheck ]
  %next.gep = getelementptr i8* %src, i64 %index
  %next.gep110 = getelementptr i8* %dst, i64 %index
  %6 = bitcast i8* %next.gep to <16 x i8>*
  %wide.load = load <16 x i8>* %6, align 1
  %next.gep.sum586 = or i64 %index, 16
  %7 = getelementptr i8* %src, i64 %next.gep.sum586
  %8 = bitcast i8* %7 to <16 x i8>*
  %wide.load207 = load <16 x i8>* %8, align 1
  %9 = bitcast i8* %next.gep110 to <16 x i8>*
  store <16 x i8> %wide.load, <16 x i8>* %9, align 1
  %next.gep110.sum603 = or i64 %index, 16
  %10 = getelementptr i8* %dst, i64 %next.gep110.sum603
  %11 = bitcast i8* %10 to <16 x i8>*
  store <16 x i8> %wide.load207, <16 x i8>* %11, align 1
  %index.next = add i64 %index, 32
  %12 = icmp eq i64 %index.next, %n.vec
  br i1 %12, label %middle.block, label %vector.body, !llvm.loop !12

middle.block:                                     ; preds = %vector.body, %vector.memcheck, %.lr.ph.preheader
  %resume.val = phi i8* [ %src, %.lr.ph.preheader ], [ %src, %vector.memcheck ], [ %ptr.ind.end, %vector.body ]
  %resume.val12 = phi i8* [ %dst, %.lr.ph.preheader ], [ %dst, %vector.memcheck ], [ %ptr.ind.end13, %vector.body ]
  %resume.val14 = phi i64 [ %count, %.lr.ph.preheader ], [ %count, %vector.memcheck ], [ %rev.ind.end, %vector.body ]
  %new.indc.resume.val = phi i64 [ 0, %.lr.ph.preheader ], [ 0, %vector.memcheck ], [ %n.vec, %vector.body ]
  %cmp.n = icmp eq i64 %new.indc.resume.val, %count
  br i1 %cmp.n, label %.loopexit, label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph, %middle.block
  %b.04 = phi i8* [ %14, %.lr.ph ], [ %resume.val, %middle.block ]
  %a.03 = phi i8* [ %16, %.lr.ph ], [ %resume.val12, %middle.block ]
  %.02 = phi i64 [ %13, %.lr.ph ], [ %resume.val14, %middle.block ]
  %13 = add i64 %.02, -1
  %14 = getelementptr inbounds i8* %b.04, i64 1
  %15 = load i8* %b.04, align 1, !tbaa !10
  %16 = getelementptr inbounds i8* %a.03, i64 1
  store i8 %15, i8* %a.03, align 1, !tbaa !10
  %17 = icmp eq i64 %13, 0
  br i1 %17, label %.loopexit, label %.lr.ph, !llvm.loop !13

; <label>:18                                      ; preds = %2
  %19 = add i64 %count, -1
  %20 = icmp eq i64 %count, 0
  br i1 %20, label %.loopexit, label %.lr.ph9

.lr.ph9:                                          ; preds = %18
  %21 = getelementptr inbounds i8* %src, i64 %19
  %22 = getelementptr inbounds i8* %dst, i64 %19
  %n.vec215 = and i64 %count, -32
  %cmp.zero217 = icmp eq i64 %n.vec215, 0
  %23 = add i64 %count, -1
  br i1 %cmp.zero217, label %middle.block210, label %vector.memcheck224

vector.memcheck224:                               ; preds = %.lr.ph9
  %scevgep219 = getelementptr i8* %src, i64 %23
  %scevgep218 = getelementptr i8* %dst, i64 %23
  %bound1221 = icmp ule i8* %scevgep219, %dst
  %bound0220 = icmp ule i8* %scevgep218, %src
  %memcheck.conflict223 = and i1 %bound0220, %bound1221
  %.sum = sub i64 %19, %n.vec215
  %rev.ptr.ind.end = getelementptr i8* %src, i64 %.sum
  %.sum439 = sub i64 %19, %n.vec215
  %rev.ptr.ind.end229 = getelementptr i8* %dst, i64 %.sum439
  %rev.ind.end231 = sub i64 %count, %n.vec215
  br i1 %memcheck.conflict223, label %middle.block210, label %vector.body209

vector.body209:                                   ; preds = %vector.body209, %vector.memcheck224
  %index212 = phi i64 [ %index.next234, %vector.body209 ], [ 0, %vector.memcheck224 ]
  %.sum440 = sub i64 %19, %index212
  %.sum472 = sub i64 %19, %index212
  %next.gep236.sum = add i64 %.sum440, -15
  %24 = getelementptr i8* %src, i64 %next.gep236.sum
  %25 = bitcast i8* %24 to <16 x i8>*
  %wide.load434 = load <16 x i8>* %25, align 1
  %reverse = shufflevector <16 x i8> %wide.load434, <16 x i8> undef, <16 x i32> <i32 15, i32 14, i32 13, i32 12, i32 11, i32 10, i32 9, i32 8, i32 7, i32 6, i32 5, i32 4, i32 3, i32 2, i32 1, i32 0>
  %.sum505 = add i64 %.sum440, -31
  %26 = getelementptr i8* %src, i64 %.sum505
  %27 = bitcast i8* %26 to <16 x i8>*
  %wide.load435 = load <16 x i8>* %27, align 1
  %reverse436 = shufflevector <16 x i8> %wide.load435, <16 x i8> undef, <16 x i32> <i32 15, i32 14, i32 13, i32 12, i32 11, i32 10, i32 9, i32 8, i32 7, i32 6, i32 5, i32 4, i32 3, i32 2, i32 1, i32 0>
  %reverse437 = shufflevector <16 x i8> %reverse, <16 x i8> undef, <16 x i32> <i32 15, i32 14, i32 13, i32 12, i32 11, i32 10, i32 9, i32 8, i32 7, i32 6, i32 5, i32 4, i32 3, i32 2, i32 1, i32 0>
  %next.gep333.sum = add i64 %.sum472, -15
  %28 = getelementptr i8* %dst, i64 %next.gep333.sum
  %29 = bitcast i8* %28 to <16 x i8>*
  store <16 x i8> %reverse437, <16 x i8>* %29, align 1
  %reverse438 = shufflevector <16 x i8> %reverse436, <16 x i8> undef, <16 x i32> <i32 15, i32 14, i32 13, i32 12, i32 11, i32 10, i32 9, i32 8, i32 7, i32 6, i32 5, i32 4, i32 3, i32 2, i32 1, i32 0>
  %.sum507 = add i64 %.sum472, -31
  %30 = getelementptr i8* %dst, i64 %.sum507
  %31 = bitcast i8* %30 to <16 x i8>*
  store <16 x i8> %reverse438, <16 x i8>* %31, align 1
  %index.next234 = add i64 %index212, 32
  %32 = icmp eq i64 %index.next234, %n.vec215
  br i1 %32, label %middle.block210, label %vector.body209, !llvm.loop !14

middle.block210:                                  ; preds = %vector.body209, %vector.memcheck224, %.lr.ph9
  %resume.val225 = phi i8* [ %21, %.lr.ph9 ], [ %21, %vector.memcheck224 ], [ %rev.ptr.ind.end, %vector.body209 ]
  %resume.val227 = phi i8* [ %22, %.lr.ph9 ], [ %22, %vector.memcheck224 ], [ %rev.ptr.ind.end229, %vector.body209 ]
  %resume.val230 = phi i64 [ %count, %.lr.ph9 ], [ %count, %vector.memcheck224 ], [ %rev.ind.end231, %vector.body209 ]
  %new.indc.resume.val232 = phi i64 [ 0, %.lr.ph9 ], [ 0, %vector.memcheck224 ], [ %n.vec215, %vector.body209 ]
  %cmp.n233 = icmp eq i64 %new.indc.resume.val232, %count
  br i1 %cmp.n233, label %.loopexit, label %scalar.ph211

scalar.ph211:                                     ; preds = %scalar.ph211, %middle.block210
  %b.18 = phi i8* [ %34, %scalar.ph211 ], [ %resume.val225, %middle.block210 ]
  %a.17 = phi i8* [ %36, %scalar.ph211 ], [ %resume.val227, %middle.block210 ]
  %.16 = phi i64 [ %33, %scalar.ph211 ], [ %resume.val230, %middle.block210 ]
  %33 = add i64 %.16, -1
  %34 = getelementptr inbounds i8* %b.18, i64 -1
  %35 = load i8* %b.18, align 1, !tbaa !10
  %36 = getelementptr inbounds i8* %a.17, i64 -1
  store i8 %35, i8* %a.17, align 1, !tbaa !10
  %37 = icmp eq i64 %33, 0
  br i1 %37, label %.loopexit, label %scalar.ph211, !llvm.loop !15

.loopexit:                                        ; preds = %scalar.ph211, %middle.block210, %18, %.lr.ph, %middle.block, %.preheader, %0
  ret i8* %dst
}

; Function Attrs: nounwind uwtable
define weak i8* @mempcpy(i8* %destaddr, i8* %srcaddr, i64 %len) #3 {
  %1 = icmp eq i64 %len, 0
  br i1 %1, label %15, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %0
  %n.vec = and i64 %len, -32
  %cmp.zero = icmp eq i64 %n.vec, 0
  %2 = add i64 %len, -1
  br i1 %cmp.zero, label %middle.block, label %vector.memcheck

vector.memcheck:                                  ; preds = %.lr.ph.preheader
  %scevgep5 = getelementptr i8* %srcaddr, i64 %2
  %scevgep4 = getelementptr i8* %destaddr, i64 %2
  %bound1 = icmp uge i8* %scevgep4, %srcaddr
  %bound0 = icmp uge i8* %scevgep5, %destaddr
  %memcheck.conflict = and i1 %bound0, %bound1
  %ptr.ind.end = getelementptr i8* %srcaddr, i64 %n.vec
  %ptr.ind.end7 = getelementptr i8* %destaddr, i64 %n.vec
  %rev.ind.end = sub i64 %len, %n.vec
  br i1 %memcheck.conflict, label %middle.block, label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.memcheck
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.memcheck ]
  %next.gep = getelementptr i8* %srcaddr, i64 %index
  %next.gep104 = getelementptr i8* %destaddr, i64 %index
  %3 = bitcast i8* %next.gep to <16 x i8>*
  %wide.load = load <16 x i8>* %3, align 1
  %next.gep.sum280 = or i64 %index, 16
  %4 = getelementptr i8* %srcaddr, i64 %next.gep.sum280
  %5 = bitcast i8* %4 to <16 x i8>*
  %wide.load201 = load <16 x i8>* %5, align 1
  %6 = bitcast i8* %next.gep104 to <16 x i8>*
  store <16 x i8> %wide.load, <16 x i8>* %6, align 1
  %next.gep104.sum297 = or i64 %index, 16
  %7 = getelementptr i8* %destaddr, i64 %next.gep104.sum297
  %8 = bitcast i8* %7 to <16 x i8>*
  store <16 x i8> %wide.load201, <16 x i8>* %8, align 1
  %index.next = add i64 %index, 32
  %9 = icmp eq i64 %index.next, %n.vec
  br i1 %9, label %middle.block, label %vector.body, !llvm.loop !16

middle.block:                                     ; preds = %vector.body, %vector.memcheck, %.lr.ph.preheader
  %resume.val = phi i8* [ %srcaddr, %.lr.ph.preheader ], [ %srcaddr, %vector.memcheck ], [ %ptr.ind.end, %vector.body ]
  %resume.val6 = phi i8* [ %destaddr, %.lr.ph.preheader ], [ %destaddr, %vector.memcheck ], [ %ptr.ind.end7, %vector.body ]
  %resume.val8 = phi i64 [ %len, %.lr.ph.preheader ], [ %len, %vector.memcheck ], [ %rev.ind.end, %vector.body ]
  %new.indc.resume.val = phi i64 [ 0, %.lr.ph.preheader ], [ 0, %vector.memcheck ], [ %n.vec, %vector.body ]
  %cmp.n = icmp eq i64 %new.indc.resume.val, %len
  br i1 %cmp.n, label %._crit_edge, label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph, %middle.block
  %src.03 = phi i8* [ %11, %.lr.ph ], [ %resume.val, %middle.block ]
  %dest.02 = phi i8* [ %13, %.lr.ph ], [ %resume.val6, %middle.block ]
  %.01 = phi i64 [ %10, %.lr.ph ], [ %resume.val8, %middle.block ]
  %10 = add i64 %.01, -1
  %11 = getelementptr inbounds i8* %src.03, i64 1
  %12 = load i8* %src.03, align 1, !tbaa !10
  %13 = getelementptr inbounds i8* %dest.02, i64 1
  store i8 %12, i8* %dest.02, align 1, !tbaa !10
  %14 = icmp eq i64 %10, 0
  br i1 %14, label %._crit_edge, label %.lr.ph, !llvm.loop !17

._crit_edge:                                      ; preds = %.lr.ph, %middle.block
  %scevgep = getelementptr i8* %destaddr, i64 %len
  br label %15

; <label>:15                                      ; preds = %._crit_edge, %0
  %dest.0.lcssa = phi i8* [ %scevgep, %._crit_edge ], [ %destaddr, %0 ]
  ret i8* %dest.0.lcssa
}

; Function Attrs: nounwind uwtable
define weak i8* @memset(i8* %dst, i32 %s, i64 %count) #3 {
  %1 = icmp eq i64 %count, 0
  br i1 %1, label %._crit_edge, label %.lr.ph

.lr.ph:                                           ; preds = %0
  %2 = trunc i32 %s to i8
  br label %3

; <label>:3                                       ; preds = %3, %.lr.ph
  %a.02 = phi i8* [ %dst, %.lr.ph ], [ %5, %3 ]
  %.01 = phi i64 [ %count, %.lr.ph ], [ %4, %3 ]
  %4 = add i64 %.01, -1
  %5 = getelementptr inbounds i8* %a.02, i64 1
  store volatile i8 %2, i8* %a.02, align 1, !tbaa !10
  %6 = icmp eq i64 %4, 0
  br i1 %6, label %._crit_edge, label %3

._crit_edge:                                      ; preds = %3, %0
  ret i8* %dst
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-floa
attributes #3 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { noreturn nounwind }
attributes #6 = { nobuiltin nounwind }
attributes #7 = { nobuiltin noreturn nounwind }

!llvm.ident = !{!0, !0, !0, !0, !0, !0, !0, !0, !0, !0}

!0 = metadata !{metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)"}
!1 = metadata !{metadata !2, metadata !2, i64 0}
!2 = metadata !{metadata !"long", metadata !3, i64 0}
!3 = metadata !{metadata !"omnipotent char", metadata !4, i64 0}
!4 = metadata !{metadata !"Simple C/C++ TBAA"}
!5 = metadata !{metadata !6, metadata !6, i64 0}
!6 = metadata !{metadata !"int", metadata !3, i64 0}
!7 = metadata !{metadata !7, metadata !8, metadata !9}
!8 = metadata !{metadata !"llvm.vectorizer.width", i32 1}
!9 = metadata !{metadata !"llvm.vectorizer.unroll", i32 1}
!10 = metadata !{metadata !3, metadata !3, i64 0}
!11 = metadata !{metadata !11, metadata !8, metadata !9}
!12 = metadata !{metadata !12, metadata !8, metadata !9}
!13 = metadata !{metadata !13, metadata !8, metadata !9}
!14 = metadata !{metadata !14, metadata !8, metadata !9}
!15 = metadata !{metadata !15, metadata !8, metadata !9}
!16 = metadata !{metadata !16, metadata !8, metadata !9}
!17 = metadata !{metadata !17, metadata !8, metadata !9}
