#########################################
# 5.7 움직이는 차트에 라벨 달기
#########################################


# 1초 간격으로 그래프 그리기

library(animation)
ani.options(interval = 1)

while(TRUE) {
  y <- runif(5, 0, 1)
  bp <- barplot(y, ylim = c(0, 1), col=rainbow(5))

    text(x=bp, y=y, labels=round(y,2), pos=1)   
  
    ani.pause()
  
}

