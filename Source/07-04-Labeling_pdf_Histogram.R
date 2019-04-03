#########################################
# 7.4 확률밀도 히스토그램에 라벨달기
#########################################

#===== 라벨달기

head(quakes)
mag <- quakes$mag

colors <- c("red", "orange", "yellow", "green", "blue", "navy", "violet")

hp <- hist(mag, breaks=seq(4, 6.5, by=0.5), freq=FALSE)	 
hp                      # 변수 hp 의 값들을  꼭 확인해 보기 바람.

plot(hp,, freq=FALSE,main="지진 발생 강도의 분포", xlab="지진 강도", ylab="확률밀도",
     col=colors, ylim=c(0,1))

(height <- hp$density)

text(x=hp$mids, y=height, labels=height, pos=3)

lines(density(mag))

#======= 라벨달기 끝