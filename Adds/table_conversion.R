#------------------------------------------------
# Table Conversion : Wide Table <-> Long Table 
#------------------------------------------------

#------------------------------------------------
# tidyr package installation
#------------------------------------------------

install.packages("tidyr")
library(tidyr)

#------------------------------------------------
# 1. read Data (table_conversion__01.csv : Long Table)
#------------------------------------------------

data_table <- read.csv(file.choose(), header=T)
data_table

#------------------------------------------------
# 2. Table Conversion : Long to Wide
#------------------------------------------------

# key=�׸�, value=X2019..03.��
# ��, '�õ����̵�-�ñ�����[��]'�� �ߺ����� �־�� �ȵ�.
 
wide_table <- spread(data_table, �׸�, X2019..03.��)
wide_table

#------------------------------------------------
# 3. Table Conversion : Wide to Long
#------------------------------------------------

long_table <- gather(wide_table, '�õ�������[��]':'������[��]', key="�׸�", value="X2019..03.��")
long_table


#------------------------------------------------
# 1. read Data (table_conversion__02.csv : Long Table)
#------------------------------------------------

data_table <- read.csv(file.choose(), header=T)
data_table


#------------------------------------------------
# 2. Table Conversion : Long to Wide
#------------------------------------------------

# key=�׸�, value=X2019..03.��
wide_table <- spread(data_table, �׸�, X2019..03.��)

# ��, '�õ����̵�-�ñ�����[��]'�� �ߺ����� �־ ������ �߻���.

wide_table

#------------------------------------------------
# *** Data Table ���� ***
#------------------------------------------------

# �� ��� data file�� '�õ����̵�-�ñ�����[��]'�� �ִ� �ߺ����� �����ؾ� �Ѵ�.
# ������ ���� : table_conversion_03.csv

#------------------------------------------------
# 1. read Data (table_conversion__02.csv : Long Table)
#------------------------------------------------

data_table <- read.csv(file.choose(), header=T)
data_table


#------------------------------------------------
# 2. Table Conversion : Long to Wide
#------------------------------------------------

# key=�׸�, value=X2019..03.��
wide_table <- spread(data_table, �׸�, X2019..03.��)
wide_table

#------------------------------------------------
# 3. Table Conversion : Wide to Long
#------------------------------------------------

long_table <- gather(wide_table, '�õ�������[��]':'������[��]', key="�׸�", value="X2019..03.��")
long_table


#------------------------------------------------
# Dae Ho Kim, modurang@gmail.com
# GitHub : https://github.com/Kim-DaeHo
#------------------------------------------------

