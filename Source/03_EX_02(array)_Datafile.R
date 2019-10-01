# 1. Data �Է� (���� ����, ����/���� ������)
# -----------------------------
#------------------------------
# CSV ���Ϸ� �о� ���̱�
#------------------------------


setwd("C:/temp")

install.packages("readxl")
library(readxl)

Stud_ID_2 <- read_excel("test.xlsx", 
           col_name=TRUE,      # TRUE to use the first row as column names
           sheet=1)            # sheet = 1
Stud_ID_2

Name_2 <- read_excel("test.xlsx", 
        col_name=TRUE,      # TRUE to use the first row as column names
        sheet=2)            # sheet = 2
Name_2

Mid_2 <- read_excel("test.xlsx", 
       col_name=TRUE,      # TRUE to use the first row as column names
       sheet=3)            # sheet = 3
Mid_2

Final_2 <- read_excel("test.xlsx", 
         col_name=TRUE,      # TRUE to use the first row as column names
         sheet=4)            # sheet = 1~7
Final_2

Attendance_2 <- read_excel("test.xlsx", 
              col_name=TRUE,      # TRUE to use the first row as column names
              sheet=5)            # sheet = 1~7
Attendance_2


#------------------------------
# 2. �Է� ������ Ȯ��
#------------------------------
Stud_ID_2
Name_2
Mid_2
Final_2
Attendance_2

#------------------------------
# 3. Data ó�� : �������(Summary), ó��(�ջ� - ��Ģ����) ��
#------------------------------

test_2 <- cbind(Mid_2, Final_2, Attendance_2)
rownames(test_2) <- Name_2  # �� ���� �̸� �ο�...
test_2

total_2 <- apply(test_2, MARGIN=1, sum)  # �� �ະ �հ踦 ���Ѵ�.
test_2 <- cbind(test_2, total_2)
test_2

sum_2 <- apply(test_2, MARGIN=2, sum)  # �� ���� �հ踦 ���Ѵ�.
test_sum_2 <- rbind(test_2, sum)
test_sum_2

#------------------------------
# 4. ����� ����
#----------------------
# CSV ���Ϸ� �����Ѵ�.
#----------------------
setwd("C:/temp")   # ������ ���� ����

write.csv(test_sum_2, "test_sum_2.csv")