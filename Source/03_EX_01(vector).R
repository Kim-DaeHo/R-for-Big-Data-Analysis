# 1. Data 입력 (변수 지정, 문자/숫자 데이터)
# -----------------------------
Stud_ID <- c("191011", "191041", "192047")
Name <- c("김예리", "이예빈", "이지현")
Mid <- c(25, 30, 35)
Final <- c(36, 44, 24)
Attendance <- c(11, 20, 11.5)
#------------------------------
# CSV 파일로 읽어 들이면 편리함.
#------------------------------

# 2. 입력 데이터 확인
Stud_ID
Name
Mid
Final
Attendance

# 3. Data 처리 : 요약정보(Summary), 처리(합산 - 사칙연산) 등
summary(Mid)
summary(Final)
summary(Attendance)

total <- Mid + Final + Attendance
total

summary(Total)

# 4. 결과의 저장
#----------------------
# CSV 파일로 저장한다.
#----------------------
setwd("C:/temp")   # 저장할 폴더 지정

write.csv(Stud_ID, "Stud_ID.csv")
write.csv(Name, "Name.csv")
write.csv(Mid, "Mid.csv")
write.csv(Final, "Final.csv")
write.csv(Total, "Total.csv")
