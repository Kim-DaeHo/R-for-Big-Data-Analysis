#########################################
# 7.2 그룹형 바 차트(Grouped Bar Chart)
#########################################

height1 <- c(4, 18, 5, 8)
height2 <- c(9, 15, 20, 6)

height <- rbind(height1, height2)
height

bp <-   barplot(height, main="부서별 영업 실적",
                names.arg=name,
                xlab="부서", ylab="영업 실적(억 원)",
                col=c("darkblue","red"),
                legend.text=legend_lbl,
                ylim=c(0, 30),
                beside=TRUE,
                args.legend=list(x='top'))

text(x=bp, y=height, labels=round(height,0), pos=3)
