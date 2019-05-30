#=====================================================
# R을 이용한 사회연결망 분석 (feat. tidygraph, ggraph)
#          SNA·Social Network Analysis
#-----------------------------------------------------
# 참고 사이트  https://kuduz.tistory.com/1087
#=====================================================

#-----------------------------------------------------
# 1. 관련 패키지
#-----------------------------------------------------

install.packages(c('tidygraph', 'ggraph'))

library('tidygraph')
library('ggraph')

#-----------------------------------------------------
# 2. 피처링 데이터 불러오기
#-----------------------------------------------------
# https://kuduz.tistory.com/attachment/cfile7.uf@993F4E3E5BA097A6297F22.csv
#-----------------------------------------------------

feat <- read.csv('featuring.csv')  
feat <- read.csv(file.choose())  

head(feat)
class(feat)   # data.frame

#-----------------------------------------------------
# 3. 데이터 변환하기 : 데이터프레임 => 그래프 형식
#-----------------------------------------------------
fg <- as_tbl_graph(feat)  # tidygraph에서 as_tbl_graph()는 데이터 프레임 등을
                          # 그래프 형식으로 바꾸는 구실

class(fg)     # 'tbl_graph'는 tidygraph에서 쓰는 그래프 형식. 
              #      tbl은 'tibble'을 줄인 말
              #      tibble 혹은 tbl_df는 R에서 기본적으로 제공하는 데이터 프레임을 
              #      tidyverse에서 활용하기 쉽도록 업그레이드한 형태
              # 'igraph' 만약 tidygraph를 불러오지 않아서 tbl_df를 이해하지 못하는 환경에서는 
              #      이 데이터를 igraph 데이터 형식으로 이해하겠다는 뜻.
              #      igraph는 SNA 분야에서 유명한 패키지이기 때문이기도 하고,
              #      tidygraph가 igraph에 뿌리를 두고 있고 때문이기도 합니다.

fg            # 변환 데이터 내용 확인
              # node(노드)와 edge(엣지)라는 개념이 등장

#-----------------------------------------------------
# 4. 시각화
#-----------------------------------------------------

plot(fg)      # 기본 시각화 함수인 plot() 이용.
              # tidyverse에서는 ggplot() 함수로 시각화
              # 네트워크 시각화에서는 ggraph()가 ggplot()의 기능수행.


ggraph(fg) +                 # fg를 그래프로 그리는데  (레이아웃 지정)
       geom_node_point() +   # 노드는 점으로 찍고, 
       geom_edge_link()      # 에지는 선으로 연결.


ggraph(fg) +                              # fg를 그래프로 그리는데  (레이아웃 지정)
       geom_node_text(aes(label=name)) +  # 노드는 점으로 찍고, 
       geom_edge_link()                   # 에지는 선으로 연결.


feat %>% 
     as_tbl_graph() %>%                # feat 데이터를 as_tbl_graph() 함수에 보내 데이터 변환
     ggraph(layout='kk') +             # 변환된 데이터를 시각화
     geom_node_text(aes(label=name)) + 
     geom_edge_link(aes(start_cap = label_rect(node1.name),
                    end_cap = label_rect(node2.name)))

# layout : circle, dh, drl, fr, gem, graphopt, grid, kk, lgl, mds, kk, 
#          lgl, mds, ramdomly, star


#-----------------------------------------------------
# 5. 중심성
#-----------------------------------------------------

# 5-1. 중개 중심성
feat %>%                                         # 데이터프레임 형식의 데이터.
     as_tbl_graph() %>%                          # tbl_graph 형식의 데이터로 변환
     mutate(bet= centrality_betweenness()) %>%   # mutate() : 데이터 계산함수. 중개 중심성 centrality_betweenness().
     as_tibble %>% arrange(desc(bet))            # as_tibble() : 데이터를 tibble 형식으로 변환
                                                 # arrange() : 계산결과인 bet를 내림차순으로..

# tidygraph에 있는 중심성
#   ? 매개 중심성: centrality_betweenness()
#   ? 근접 중심성: centrality_closeness()
#   ? 고유벡터 중심성: centrality_eigen()
#   ? 페이지랭크: centrality_pagerank()
#   ? 연결 중심성: centrality_degree()

# 5-2. 중개 중심성과 근접 중심성 동시에 구하기
feat %>% 
     as_tbl_graph() %>%
     mutate(bet=centrality_betweenness(), 
            clo=centrality_closeness()) %>% 
     as_tibble
