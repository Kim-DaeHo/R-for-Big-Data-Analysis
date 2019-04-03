#########################################
# 5.9 박스 플롯에 데이터 라벨달기
#########################################


#----- p. 146 박스 플롯에 데이터 라벨달기

mag ＜- quakes$mag
boxstats <- boxplot(mag, 
                    main="지진 발생 강도의 분포", 
                    xlab="지진", 
                    ylab="발생 건수",
                    col="red",
                    notch=TRUE            # 박스의 허리를 들어가게
)


text( rep(1, NROW(boxstats$out)),       # x축으로 전체 박스 플롯
      boxstats$out,                                    # y축의 값을 기준으로 outlier를 출력할 데이터
      labels=boxstats$out,                         # y축의 값을 기준으로 outlier를 출력할 데이터의 라벨
      pos=c(4,2,2,4,4,2,2)                         # boxstats$out 의 데이터 갯수가 7개 이며, 2=왼쪽에, 4=오른쪽에 라벨 출력
)

#---- 데이터 라벨 달기 끝

