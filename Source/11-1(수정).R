#==========================================
# 11. 웹 스크래핑의 활용
#==========================================

#---------------------
# 사용할 패키지
#---------------------
library(XML)
library(httr)

#-------------------------------------------------------
# p.292 I. 특정 웹 페이지의 상품 정보 스크래핑 (단일 웹 페이지)
#-------------------------------------------------------

#------------------------------------------------
# 1. 첫 페이지
#------------------------------------------------

#------------------------------------------------
# 1-1. 첫 페이지 첫 번째 상품
#------------------------------------------------
# 웹사이트 : 쿠팡의 '여성크로스백' 검색 화면
#------------------------------------------------
url <- "http://www.coupang.com/np/search?q=%EC%97%AC%EC%84%B1%ED%81%AC%EB%A1%9C%EC%8A%A4%EB%B0%B1"

#------------------------
# 웹 문서 추출
#------------------------
# doc <- htmlParse(url, encoding="UTF-8")
# doc

doc <- GET(url)
doc

doc <- htmlParse(doc)
doc

# web_page <- readLines(url)
# doc <- htmlParse(web_page, encoding="UTF-8")


#------------------------
# 검색한 상품명 출력
#------------------------
# 상품명 추출 : id가 'productList'인 ul 태그 내의 class명이 'name'인 div 태그의 데이터 추출
#             태그 경로를 기술할 때 중간 단계를 건너뛰어 표현할 때 '//'를 사용. '[]'내에는 id 또는 class 등의 태그 구분
#------------------------

# prod_name <- xpathSApply(doc, "//ul[@id='productList']//div[@class='name']", xmlValue) 
# prod_name    # 추출한 상품명 출력

prod_name <- xpathSApply(doc, '//*[@id="185745778"]/a/dl/dd/div/div[2]', xmlValue) 

#------------------------
# 불필요한 단어 제거
#------------------------
prod_name <- gsub('\n', '', prod_name)
prod_name <- gsub(' ', '', prod_name)
prod_name

#------------------------
# 상품명에 해당하는 상품가격 추출 : 
# => id가 'productList'인 ul 태그 내의 class명이 'price-value'인 strong 태그의 데이터 추출
#------------------------
# price     <- xpathSApply(doc, "//ul[@id='productList']//strong[@class='price-value']", xmlValue)
# price       # 추출한 상품가격 출력

price     <- xpathSApply(doc, '//*[@id="185745778"]/a/dl/dd/div/div[3]/div[1]/div[1]/em/strong', xmlValue)
price       # 추출한 상품가격 출력

#------------------------
# 데이터프레임 만들기 : 추출한 prod_name과 price를 상품명의 가격의 항목으로 데이터 프레임 만들기
#------------------------
df <- data.frame(상품명=prod_name, 가격=price) 
df

df$상품명 <- format(df$상품명, justify = "left")
df


#------------------------------------------------
# 1-2. 첫 페이지 두 번째 상품
#------------------------------------------------

#------------------------
# 검색한 상품명 출력
#------------------------
# 상품명 추출 : id가 'productList'인 ul 태그 내의 class명이 'name'인 div 태그의 데이터 추출
#             태그 경로를 기술할 때 중간 단계를 건너뛰어 표현할 때 '//'를 사용. '[]'내에는 id 또는 class 등의 태그 구분
#------------------------

# prod_name <- xpathSApply(doc, "//ul[@id='productList']//div[@class='name']", xmlValue) 
# prod_name    # 추출한 상품명 출력

prod_name <- xpathSApply(doc, '//*[@id="146096374"]/a/dl/dd/div/div[2]', xmlValue) 

#------------------------
# 불필요한 단어 제거
#------------------------
prod_name <- gsub('\n', '', prod_name)
prod_name <- gsub(' ', '', prod_name)
prod_name

#------------------------
# 상품명에 해당하는 상품가격 추출 : 
# => id가 'productList'인 ul 태그 내의 class명이 'price-value'인 strong 태그의 데이터 추출
#------------------------
# price     <- xpathSApply(doc, "//ul[@id='productList']//strong[@class='price-value']", xmlValue)
# price       # 추출한 상품가격 출력

price     <- xpathSApply(doc, '//*[@id="146096374"]/a/dl/dd/div/div[3]/div[1]/div[1]/em/strong', xmlValue)
price       # 추출한 상품가격 출력

#------------------------
# 데이터프레임 만들기 : 추출한 prod_name과 price를 상품명의 가격의 항목으로 데이터 프레임 만들기
#------------------------
df <- data.frame(상품명=prod_name, 가격=price) 
df

df$상품명 <- format(df$상품명, justify = "left")
df


     