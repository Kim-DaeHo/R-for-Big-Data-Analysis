# 1. Data 입력 (변수 지정, 문자/숫자 데이터)
# -----------------------------
#------------------------------
# CSV 파일로 읽어 들이기
#------------------------------


setwd("C:/temp")

install.packages("readxl")
library(readxl)

Stud_ID_1 <- read_excel("test.xlsx", 
           col_name=TRUE,      # TRUE to use the first row as column names
           sheet=1)            # sheet = 1
Stud_ID_1

Name_1 <- read_excel("test.xlsx", 
        col_name=TRUE,      # TRUE to use the first row as column names
        sheet=2)            # sheet = 2
Name_1

Dept_1 <- read_excel("test.xlsx", 
       col_name=TRUE,      # TRUE to use the first row as column names
       sheet=3)            # sheet = 3
Dept_1


Mid_1 <- read_excel("test.xlsx", 
       col_name=TRUE,      # TRUE to use the first row as column names
       sheet=4)            # sheet = 3
Mid_1

Final_1 <- read_excel("test.xlsx", 
         col_name=TRUE,      # TRUE to use the first row as column names
         sheet=5)            # sheet = 1~7
Final_1

Attendance_1 <- read_excel("test.xlsx", 
              col_name=TRUE,      # TRUE to use the first row as column names
              sheet=6)            # sheet = 1~7
Attendance_1


#------------------------------
# 2. 입력 데이터 확인
#------------------------------
Stud_ID_1
Name_1
Dept_1
Mid_1
Final_1
Attendance_1

#------------------------------
# 3. Data 처리 : 요약정보(Summary), 처리(합산 - 사칙연산) 등
#------------------------------

summary(Mid_1)
summary(Final_1)
summary(Attendance_1)

total_1 <- Mid_1 + Final_1 + Attendance_1
total_1

summary(Total_1)

#------------------------------
# 4. 결과의 저장
#----------------------
# CSV 파일로 저장한다.
#----------------------
setwd("C:/temp")   # 저장할 폴더 지정

write.csv(test_sum_2, "test_sum_2.csv")
