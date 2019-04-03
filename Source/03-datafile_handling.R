###################################
#     외부데이터 사용하기
###################################


###################################
# 1. 엑셀파일(.xlsx) 불러오기
###################################

# - excel_exam.xlsx 파일을 프로젝트 루트 디렉토리에 가져놓는다.


# - 엑셀파일을 R작업공간에 불러오기 위해 엑셀 파일을 불러오는 기능을 제공하는 패키지를 설치한다.
# - readxl 패키지에서 제공하는 read_excel()를 이용해 엑셀파일을 데이터 프레임 구조로 R에 가져온다.

install.packages("readxl")
library(readxl)

# 1) R에서는 파일명을 지정할 때 항상 앞뒤가 따옴표를 넣는다.

df_exam.1 <- read_excel("excel_exam.xlsx")     # 엑셀 파일을 불러와서 df_exam에 할당
df_exam.1                                      # 출력

str(df_exam)

mean(df_exam$english)                # english 컬럼의 평균 구하기
mean(df_exam$science)                # science 컬럼의 평균 구하기


# 2) 프로젝트 폴더가 아닌곳에서 엑셀파일을 불러오려면 파일 경로를 지정하면 됩니다.

df_exam.2 <- read_excel("C:/temp/excel_exam.xlsx")  # 엑셀 파일을 불러와서 df_exam에 할당
df_exam.2 


# 3) read_excel()은 기본적으로 엑셀의 첫행을 변수명로 인식해서 불러옵니다.
#    만약 첫행에 변수명이 없는경우에는 첫행의 데이타가 손실되어 읽어옵니다.

df_exam_novar <- read_excel("excel_exam_novar.xlsx")
df_exam_novar

# - 엑셀파일의 첫행이 변수명이 없는경우 read_excel()함수에 col_names=F 라는 파라메터를 추가한다.
# - F는 논리형 FALSE를 나타내며 대문자로 입력해야 하며 F, T로 입력해도 됩니다.

df_exam_novar <- read_excel("excel_exam_novar.xlsx", col_names = F)
df_exam_novar


# 4) 엑셀 파일에 시트가 여러 개인경우 불러올 sheet는 
#    sheet파라미터를 이용해서 몇 번째 시트의 데이터인지 지정한다.


# -. 엑셀 파일의 세 번째 시트에 있는 데이터 불러오기

df_exam_sheet <- read_excel("excel_exam_sheet.xlsx", sheet = 3)
df_exam_sheet



###################################
# 2. CSV파일(.csv) 불러오기
###################################

# - CSV(Comma-separated Values)라는 파일은 값들이 쉽표로 구분되어 있는 형태이다.
# - 다양한 프로그램에서 지원하고 엑셀 파일에 비해 용량이 작기 때문에 데이터를 주고받을 때 많이 사용된다.

# 1) 프로젝트 폴더에 csv_exam.csv파일을 넣는다.
# - 별도의 패키지를 설치하지 않고 R에 기본적으로 내장된 read.csv()를 이용하여 CSV파일을 R로 읽어온다.
# - 첫번째 행에 변수명이 없을시 header=F 파라미터를 지정한다.

df_csv_exam <- read.csv("csv_exam.csv")
str(df_csv_exam)

df_csv_exam



###################################
# 3. 데이터 프레임을 CSV파일로 저장하기
###################################

# - R의 내장 함수인 write.csv()를 이용해서 데이터 프레임을 CSV 파일로 저장.
# - file 파라미터에 저장할 파일명을 지정합니다.
# - 저장된 파일은 프로젝트 폴더에 생성된다.

# 데이터프레임을 생성한다.

df_midterm <- data.frame(english = c(90, 80, 60, 70),
                         math = c(50, 60, 100, 20),
                         class = c(1, 1, 2, 2))
df_midterm                                     #  내용확인

write.csv(df_midterm, file = "df_midterm.csv") #  CSV파일로 저장



###################################
# 4. 데이터 프레임을 txt 파일로 저장하기
###################################

# write.table() 함수를 사용한다.
# write.table(데이터명, file="파일위치/파일명.txt", sep=",", rownames=FALSE)
#             sep = "," ==> 데이터 구분자 지정

# -. df_midterm 데이터프레임을 txt 파일로 저장하기

write.table(df_midterm, file="df_midterm.txt", sep",", rownames=FALSE) 



###################################
# 5. 데이터 프레임을 RData에 저장하기
###################################

# - RData는 R전용 데이터 파일 이므로 R에서 읽고 쓰는 속도가 다른 파일에 비해 빠르고 용량이 작다.
# - R에서 분석작업을 할때 RData를 사용하고 R아닌 곳에서 파일을 주고 받을 때에는 CSV를 사용한다.

# - save()를 이용하여 데이터 프레임을 rda파일로 저장한다.

# - rda파일을 불러올때는 load()함수를 이용한다. rda파일을 불러오면 저장할때 사용한 데이터 프레임이
# 동으로 만들어진다.

df_midterm <- data.frame(english = c(90, 80, 60, 70),
                         math = c(50, 60, 100, 20),
                         class = c(1, 1, 2, 2))
df_midterm

save(df_midterm, file = "df_midterm2.rda")

rm(df_midterm)            # 데이터프레임 삭제
df_midterm


load("df_midterm2.rda")   # 불러올때 저장시 사용한 df_midterm가 자동으로 생성됨
df_midterm
