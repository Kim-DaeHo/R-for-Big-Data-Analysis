#------------------------------------------------
# Table Conversion : Wide Table <-> Long Table 
#------------------------------------------------

#------------------------------------------------
# tidyr package installation
#------------------------------------------------

install.packages("tidyr")
library(tidyr)

#------------------------------------------------
# read Data (table_conversion__01.csv : Long Table)
#------------------------------------------------

data_table <- read.csv(file.choose(), header=T)
data_table

#------------------------------------------------
# Table Conversion : Long to Wide
#------------------------------------------------

# key=항목, value=X2019..03.월
# 단, '시도내이동-시군구내[명]'에 중복값이 있어서는 안됨.
 
wide_table <- spread(data_table, 항목, X2019..03.월)
wide_table

#------------------------------------------------
# Table Conversion : Wide to Long
#------------------------------------------------

long_table <- gather(wide_table, '시도간전입[명]':'총전출[명]', key="항목", value="X2019..03.월")
long_table


#------------------------------------------------
# read Data (table_conversion__02.csv : Long Table)
#------------------------------------------------

data_table <- read.csv(file.choose(), header=T)
data_table


#------------------------------------------------
# Table Conversion : Long to Wide
#------------------------------------------------

# key=항목, value=X2019..03.월
wide_table <- spread(data_table, 항목, X2019..03.월)

# 단, '시도내이동-시군구내[명]'에 중복값이 있어서 에러가 발생됨.

wide_table

#------------------------------------------------
# Data Table 수정
#------------------------------------------------

# 이 경우 data file의 '시도내이동-시군구내[명]'에 있는 중복값을 수정해야 한다.
# 수정된 파일 : table_conversion_03.csv

#------------------------------------------------
# read Data (table_conversion__02.csv : Long Table)
#------------------------------------------------

data_table <- read.csv(file.choose(), header=T)
data_table


#------------------------------------------------
# Table Conversion : Long to Wide
#------------------------------------------------

# key=항목, value=X2019..03.월
wide_table <- spread(data_table, 항목, X2019..03.월)
wide_table

#------------------------------------------------
# Table Conversion : Wide to Long
#------------------------------------------------

long_table <- gather(wide_table, '시도간전입[명]':'총전출[명]', key="항목", value="X2019..03.월")
long_table


#------------------------------------------------
# Dae Ho Kim, modurang@gmail.com
# GitHub : https://github.com/Kim-DaeHo
#------------------------------------------------


