##################################################
# 3. 오픈 API 활용
##################################################


##################################################
# 1) p.251 노선 번호에 대한 노선 ID 확인  
##################################################

install.packages("XML")
install.packages("ggmap")
library(XML)
library(ggmap)

busRtNm <- "402"                      # 검색할 노선버스 번호
API_key <- "Open API Key"    # data.go.kr에서 발급받은 API_key 입력

url <- paste("http://ws.bus.go.kr/api/rest/busRouteInfo/getBusRouteList?ServiceKey=", API_key, "&strSrch=", busRtNm,sep="")
xmefile <- xmlParse(url)
xmlRoot(xmefile)

# p.252
df <- xmlToDataFrame(getNodeSet(xmefile, "//itemList"))
head(df)

df_busRoute <- subset(df, busRouteNm==busRtNm)
df_busRoute

df_busRoute$busRouteId

##################################################
# p.253 노선 ID에 대한 버스 실시간 위치 정보 확인
##################################################

API_key <- "Open API Key"       # data.go.kr에서 발급받은 API_key 입력
url <- paste("http://ws.bus.go.kr/api/rest/buspos/getBusPosByRtid?ServiceKey=", API_key, "&busRouteId=",
            df_busRoute$busRouteId, sep="")
xmefile <- xmlParse(url)
xmlRoot(xmefile)

# p.254
df <- xmlToDataFrame(getNodeSet(xmefile, "//itemList"))
df

gpsX <- as.numeric(as.character(df$gpsX))
gpsY <- as.numeric(as.character(df$gpsY))
gc <- data.frame(lon=gpsX, lat=gpsY)
gc

##################################################
# p.257 구글 맵에 버스 위치 출력
##################################################

register_google(key="Google API Key")      # https://console.cloud.google.com 에서 확인

cen <- c(mean(gc$lon), mean(gc$lat))
map <- get_googlemap(center=cen, maptype="roadmap",zoom=11, marker=gc)
ggmap(map, extent="device")

##################################################

