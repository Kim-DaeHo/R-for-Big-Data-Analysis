#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# R에서 ggmap, ggplot2 패키지를 이용한 지도 출력 및 경로 표현하기 간단예제
# 참고사이트 : https://lovetoken.github.io/r/data_visualization/2016/10/18/ggmap.html
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

install.packages("ggmap")
install.packages("ggplot2")
library(ggmap)
library(ggplot2)

register_google(key="Google API Key")      # https://console.cloud.google.com 에서 확인

# 대한민국 geocode
geocode('Korea', source='google')

# 서울 
getmap <- get_googlemap("seoul")
(p1 <- ggmap(getmap))                                          # 그림 1.

# p1 <- get_googlemap("seoul") %>% ggmap

#---------------------------------
# 서초역과 강남역의 두 지점
#---------------------------------
locationInfo <- data.frame(
   Name = c("서초역", "강남역"), 
   lon = c(127.007675, 127.027544),
   lat = c(37.491843, 37.497968) 
)

#---------------------------------
# 1. 두 지점을 점으로 표시하기
#---------------------------------
p1 + geom_point(data = locationInfo, 
                aes(x = lon, y = lat))


#---------------------------------
# 2. 지도 확대하기
#---------------------------------
getmap <- get_googlemap("gangnamgu", zoom = 12)    # zoom=12
p2 <- ggmap(getmap)
p2 + geom_point(data = locationInfo, 
                aes(x = lon, y = lat)) 

#---------------------------------
# 3. 두 지점에 지역명 표시하기
#---------------------------------
p2 + 
geom_point(data = locationInfo, 
           aes(x = lon, y = lat)) +
geom_text(data = locationInfo, 
          aes(label = Name), 
          size = 3, vjust = -1)

#---------------------------------
# 4. 신분당선 전철 경로 그리기
#---------------------------------
# 1) 신 분당선역 정보
#---------------------------------
locationInfo <- data.frame(
    Name = c("강남", "양재", "양재시민의숲", "청계산입구", "판교", "정자"), 
    lon = c(127.028046, 127.035140, 127.038451, 127.054769, 127.111172, 127.108367), 
    lat = c(37.497001, 37.483368, 37.469655, 37.448196, 37.394786, 37.366777)
)
locationInfo

#---------------------------------
# 2) 지도정보
#---------------------------------
getmap <- get_googlemap("gwacheon", zoom = 11)
p3 <- ggmap(getmap)

#---------------------------------
# 3) 역을 점으로 표시하고, 역명 표시하기
#---------------------------------
p4 <- p3 + geom_point(data = locationInfo, aes(x = lon, y = lat)) +
           geom_text(data = locationInfo, 
                     aes(label = Name), 
                     size = 4, hjust = 1.2, fontface = "bold")
p4

#---------------------------------
# 4) 역과 역을 선으로 잇기 (경로 표시)
#---------------------------------
p5 <- p4 + geom_path(data = locationInfo, 
               aes(x = lon, y = lat), 
               color = "blue", alpha = .5, lwd = 1)
p5

#---------------------------------
## extent=device
#---------------------------------

#---------------------------------
# option의 설정
#---------------------------------
# 1) extent = "device"      
#---------------------------------
getmap <- get_googlemap("seoul")
(p6 <- ggmap(getmap, extent = "device"))      # 그림 6.


#---------------------------------
# 2) get_googlemap(maptype = "satellite") : 4 종류 : "terrain", "satellite", "roadmap", "hybrid"
#---------------------------------
getmap <- get_googlemap("seoul", maptype = "satellite")
(p7 <- ggmap(getmap, extent = "device"))      # 그림 7.


#---------------------------------
# 3) 지도 제목 달기
#---------------------------------
p5 + ggtitle("신분당선 경로 : satellite")           # 그림 8.

#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

