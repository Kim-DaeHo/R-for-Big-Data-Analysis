#########################################
# 7.6 r계급의 수 라벨달기
#########################################


head(quakes)
mag <- quakes$mag

colors <- c("red", "orange", "yellow", "green", "blue", "navy", "violet")

h <- hist(mag, breaks="Sturges")

plot(h,,main="지진 발생 강도의 분포", xlab="지진 강도", ylab="발생 건수",
     col=colors, ylim=c(0,250))

(height <- h$counts)

#=== 라벨달기
text(x=h$mids, y=height, labels=round(height,0), pos=3)
#=== 라벨달기 끝