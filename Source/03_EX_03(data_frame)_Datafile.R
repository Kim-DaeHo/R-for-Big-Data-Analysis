# 1. Data �Է� (���� ����, ����/���� ������)
# -----------------------------
df.test_1 <- read.csv("test.csv")

# 2. �Է� ������ Ȯ��
df.test_1

# 3. Data ó�� : �������(Summary), ó��(�ջ� - ��Ģ����) ��
df.test_1$total <- df.test_1$Mid + df.test_1$Final + df.test_1$Attendance
df.test_1

summary(df.test_1)


# 4. ����� ����
#----------------------
# CSV ���Ϸ� �����Ѵ�.
#----------------------
setwd("C:/temp")   # ������ ���� ����

write.csv(df.test_1, "df_test_1.csv")