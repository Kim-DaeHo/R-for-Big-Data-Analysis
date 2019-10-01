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
test <- cbind(Mid, Final, Attendance)
rownames(test) <- Name  # �� ���� �̸� �ο�...
test

total <- apply(test, MARGIN=1, sum)  # �� �ະ �հ踦 ���Ѵ�.
test <- cbind(test, total)
test

sum <- apply(test, MARGIN=2, sum)  # �� ���� �հ踦 ���Ѵ�.
test_sum <- rbind(test, sum)
test_sum

# 3. ����� ����
#----------------------
# CSV ���Ϸ� �����Ѵ�.
#----------------------
setwd("C:/temp")   # ������ ���� ����

write.csv(test_sum, "test_sum.csv")