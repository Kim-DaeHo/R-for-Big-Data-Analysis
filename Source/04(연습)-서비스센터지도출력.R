install.packages("ggplot2")
install.packages("RgoogleMaps")
install.packages("ggmap")

library(ggplot2)
library(RgoogleMaps)
library(ggmap)

register_google(key="API_key")     # Google API Key 사용

# 주소록 파일(csv)을 불러온다. 
# 단. csv 파일은 엑셀파일 작성 후 저장 시, 
# [CSV(쉼표로 분리)(*.csv)] 형식으로 저장이 되어 있어야 함

df.addr <- read.csv(file.choose())
df.addr

# 주소 열을 문자벡터로 변환하여 addr에 저장한다.
addr <- as.character(df.addr$주소)
addr

gc <- geocode(enc2utf8(addr))

# 센터명 열을 문자벡터로 변환하여 names에 저장한다.
names <- as.character(df.addr$센터명)

df <- data.frame(name=names, lon=gc$lon, lat=gc$lat)
df

cen <- c(mean(df$lon), mean(df$lat))
cen

map <- get_googlemap(center=cen, maptype="roadmap",zoom=11, marker=gc)

ggmap(map, fullpage = TRUE)