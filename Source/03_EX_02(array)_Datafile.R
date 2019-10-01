# 1. Data 입력 (변수 지정, 문자/숫자 데이터)
# -----------------------------
#------------------------------
# CSV 파일로 읽어 들이기
#------------------------------


setwd("C:/temp")

# install.packages("readxl")
library(readxl)

Stud_ID_2 <- read_excel("test.xlsx", 
           col_name=TRUE,      # TRUE to use the first row as column names
           sheet=1)            # sheet = 1
Stud_ID_2

Name_2 <- read_excel("test.xlsx", 
        col_name=TRUE,      # TRUE to use the first row as column names
        sheet=2)            # sheet = 2
Name_2

Dept_2 <- read_excel("test.xlsx", 
       col_name=TRUE,      # TRUE to use the first row as column names
       sheet=3)            # sheet = 3
Dept_2


Mid_2 <- read_excel("test.xlsx", 
       col_name=TRUE,      # TRUE to use the first row as column names
       sheet=4)            # sheet = 3
Mid_2

Final_2 <- read_excel("test.xlsx", 
         col_name=TRUE,      # TRUE to use the first row as column names
         sheet=5)            # sheet = 1~7
Final_2

Attendance_2 <- read_excel("test.xlsx", 
              col_name=TRUE,      # TRUE to use the first row as column names
              sheet=6)            # sheet = 1~7
Attendance_2


#------------------------------
# 2. 입력 데이터 확인
#------------------------------
Stud_ID_2
Name_2
Dept_2
Mid_2
Final_2
Attendance_2

#------------------------------
# 3. Data 처리 : 요약정보(Summary), 처리(합산 - 사칙연산) 등
#------------------------------

test_2 <- cbind(Mid_2, Final_2, Attendance_2)
rownames(test_2) <- Name_2  # 각 행의 이름 부여...
test_2

total_2 <- apply(test_2, MARGIN=1, sum)  # 각 행별 합계를 구한다.
test_2 <- cbind(test_2, total_2)
test_2

sum_2 <- apply(test_2, MARGIN=2, sum)  # 각 열별 합계를 구한다.
test_sum_2 <- rbind(test_2, sum)
test_sum_2

#------------------------------
# 4. 결과의 저장
#----------------------
# CSV 파일로 저장한다.
#----------------------
setwd("C:/temp")   # 저장할 폴더 지정

write.csv(test_sum_2, "test_sum_2.csv")
