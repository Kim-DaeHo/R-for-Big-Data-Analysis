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

wide_table <- spread(data_table, 항목, X2019..03.월)
wide_table

#------------------------------------------------
# Table Conversion : Wide to Long
#------------------------------------------------

long_table <- gather(wide_table, '시도간전입[명]':'총전출[명]', key="항목", value="X2019..03.월")
long_table


