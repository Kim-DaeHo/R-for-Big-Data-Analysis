# 1. Data �Է� (���� ����, ����/���� ������)
# -----------------------------
Stud_ID <- c("191011", "191041", "192047")
Name <- c("�迹��", "�̿���", "������")
Mid <- c(25, 30, 35)
Final <- c(36, 44, 24)
Attendance <- c(11, 20, 11.5)
#------------------------------
# CSV ���Ϸ� �о� ���̸� ������.
#------------------------------

# 2. �Է� ������ Ȯ��
Stud_ID
Name
Mid
Final
Attendance

# 2. Data ó�� : �������(Summary), ó��(�ջ� - ��Ģ����) ��
df.test <- data.frame(Stud_ID, Name, Mid, Final, Attendance)
df.test

df.test$total <- df.test$Mid + df.test$Final + df.test$Attendance
df.test

summary(df.test)


# 3. ����� ����
#----------------------
# CSV ���Ϸ� �����Ѵ�.
#----------------------
setwd("C:/temp")   # ������ ���� ����

write.csv(df.test, "df_test.csv")