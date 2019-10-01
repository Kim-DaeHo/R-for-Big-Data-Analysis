# 1. Data 입력 (변수 지정, 문자/숫자 데이터)
# -----------------------------
df.test_1 <- read.csv("test.csv")

# 2. 입력 데이터 확인
df.test_1

# 3. Data 처리 : 요약정보(Summary), 처리(합산 - 사칙연산) 등
df.test_1$total <- df.test_1$Mid + df.test_1$Final + df.test_1$Attendance
df.test_1

summary(df.test_1)


# 4. 결과의 저장
#----------------------
# CSV 파일로 저장한다.
#----------------------
setwd("C:/temp")   # 저장할 폴더 지정

write.csv(df.test_1, "df_test_1.csv")
