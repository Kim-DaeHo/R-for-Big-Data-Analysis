##################################################
# 2. 지역별 인구수의 변화에 대한 클라우드 출력
##################################################


##################################################
# 1) p.202 지역별 순이동에 따른 워드 클라우드
##################################################

install.packages("wordcloud")
library(wordcloud)

word<- c("인천광역시", "강화군", "옹진군")
frequency <- c(651, 85, 61)

wordcloud(word, frequency, colors="blue")


##################################################
# 2) p.203 단어들의 색 변환
##################################################

wordcloud(word, frequency, random.order=F, random.color=F, colors=rainbow(length(word)))



##################################################
# 3) p.204 다양한 단어 색 출력을 위한 팔레트 패키지의 활용
##################################################

install.packages("RColorBrewer")
library(RColorBrewer)      

pal2 <- brewer.pal(8,"Dark2")

word <- c("인천광역시", "강화군", "옹진군")
frequency <- c(651, 85, 61)
wordcloud(word, frequency, colors=pal2)


##################################################
# 4) p.211 페이지 로딩 및 데이터 파일 열기
##################################################

library(wordcloud)
library(RColorBrewer)
pal2 <- brewer.pal(8,"Dark2")

data <- read.csv(file.choose(), header=T)
head(data)

##################################################
# 데이터 정제: 불필요 지역 제외
# '전국' 지역 제외 
##################################################

data2 <- data[data$행정구역.시군구.별 != "전국", ]
head(data2)

# p.212 '구’ 단위 지역 통계 삭제

x <- grep("구$", data2$행정구역.시군구.별)
data3 <- data2[-c(x), ]
head(data3)

##################################################
# p.213 전입자 수가  많은 지역
##################################################

data4 <- data3[data3$순이동.명>0, ]
word <- data4$행정구역.시군구.별
frequency <- data4$순이동.명
wordcloud(word, frequency, colors=pal2)


##################################################
# 전출자 수가 많은 지역
##################################################

data5 <- data3[data3$순이동.명<0, ]
word <- data5$행정구역.시군구.별
frequency <- abs(data5$순이동.명)
wordcloud(word, frequency, colors=pal2)




##################################################
# 3. p.219 연설문의 단어에 대한 워드 클라우드 만들기
##################################################

install.packages("KoNLP")  
install.packages("RColorBrewer")
install.packages("wordcloud")

library(KoNLP)
library(RColorBrewer)
library(wordcloud)

useSejongDic()  

pal2 <- brewer.pal(8,"Dark2")   

text <- readLines(file.choose())
text 

# p.220
noun <- sapply(text, extractNoun, USE.NAMES=F)
noun

noun2 <- unlist(noun) 
noun2

# p.221
word_count <- table(noun2) 
word_count  

head(sort(word_count, decreasing=TRUE), 10)

wordcloud(names(word_count),freq=word_count,scale=c(6,0.3),min.freq=3, random.order=F,rot.per=.1,colors=pal2)

##################################################
# p.222 사전에 단어 추가 및 추출된 명사의 삭제
##################################################

mergeUserDic(data.frame(c("정치"), c("ncn")))
noun <- sapply(text, extractNoun, USE.NAMES=F)
noun2 <- unlist(noun) 

noun2 <- gsub("여러분", "", noun2)
noun2 <- gsub("우리", "", noun2)
noun2 <- gsub("오늘", "", noun2)

noun2 <- Filter(function(x){nchar(x) >= 2}, noun2)

# p.223
word_count <- table(noun2)
wordcloud(names(word_count),freq=word_count,scale=c(6,0.3),min.freq=3, random.order=F,rot.per=.1,colors=pal2)


##################################################
# 출력 결과의 이미지 저장
##################################################

setwd("/temp")  
png(filename = "speech.png", width = 480, height = 480)
# 저장 디바이스 종료 
dev.off()

##################################################
# p.226 연설문의 단어에 대한 워드 클라우드 만들기
##################################################

text <- readLines(file.choose())
noun <- sapply(text, extractNoun, USE.NAMES=F)
noun2 <- unlist(noun) 
word_count <- table(noun2) 
wordcloud(names(word_count),freq=word_count,scale=c(6,0.3),min.freq=3, random.order=F,rot.per=.1,colors=pal2)

##################################################
# 추출된 단어의 삭제 
##################################################

noun2 <- gsub("오늘세", "", noun2)
noun2 <- gsub("여러분", "", noun2)
noun2 <- gsub("우리", "", noun2)

noun2 <- Filter(function(x){nchar(x) >= 2}, noun2)

word_count <- table(noun2)
wordcloud(names(word_count),freq=word_count,scale=c(6,0.3),min.freq=3, random.order=F,rot.per=.1,colors=pal2)

##################################################

