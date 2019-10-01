######################################
#
#폴리곤 데이터를 이용한 지도 시각화
#
######################################


#GADM에서 데이터 다운로드

setwd("d:/R_edu_201909/지리정보시각화")
getwd()

install.packages("sp")
library(sp)

# depth 0
gadmKorea0 <- readRDS("gadm36_KOR_0_sp.rds")
str(gadmKorea0)
plot(gadmKorea0)

# depth 1
gadmKorea1 <- readRDS("gadm36_KOR_1_sp.rds")
str(gadmKorea1)
plot(gadmKorea1)

# depth 2
gadmKorea2 <- readRDS("gadm36_KOR_2_sp.rds")
str(gadmKorea2)
plot(gadmKorea2)

str(gadmKorea2 )
#울산지역만 추출하여 '구'별 지도 생성
gadmUlsan2<-gadmKorea2[gadmKorea2$NAME_1 == 'Ulsan',]
plot(gadmUlsan2, col=c(1:length(unique(gadmUlsan2$NAME_2))))
#-중복이 없는 유일한관측치를 선별할 때 사용하는함수

#시도 이름 알아내기
unique(gadmKorea2$NAME_1)

#울산시 구 이름 알아내기
unique(gadmUlsan2$NAME_2)

######################################
#
#maps 패키지를 이용한 그림그리기
#
######################################

install.packages("maps")
library(maps)

# 기본적으로 가지고 있는 맵
#   county, france, italy, nz, state.carto, 
#   state.vbm, state, vsa, world2, world

map("world")

map("south korea")

# 예제 1 : maps를 이용하여 이탈리아 그리기
map("italy", fill=TRUE, col=1:10)

# 예제2 : map.text()를 이용하여 
#         미국 뉴저지(New Jersey)주의 모든 카운티 
#         그리고 이름 표시
map.text("county", "new jersey")

# 예제3 : map.cities()를 이용하여
#         중국 지도 위에 대표 도시의 위치를 
#         표시
map("world","China")
map.cities(country="China",capitals=3)


# 예제4 : 예제3 지도하에 인구가 3,000,000 
#           보다 큰 도시만 그리기
map("world","China")
map.cities(country="China",capitals=3, minpop=3000000)



######################################
#
#mapdata 패키지를 이용한 그림그리기
#
######################################


install.packages("mapdata")
library(mapdata)

# 예제5 : maps 패키지와 mapdata 패키지를 이용하여 
#          우리나라 지도 그리기

par(mfrow = c(1, 2))

map(database='world', region=c('South Korea', 'North Korea'))
title("A")
map(database='worldHires', region=c('South Korea', 'North Korea'))
title("B")



par(mfrow = c(1, 1))

# 예제6 : 우리나나와 중국, 일본 등 주변국의 지도 그리기

map('worldHires', region = c('South Korea', 'North Korea', 'Japan', 'China'))
map('worldHires', region = c('North Korea'), col = 'red', add=T, fill=T)
map('worldHires', region = c('Japan'), col = 'black', add=T, fill=T)
map('worldHires', region = c('China'), col = 'yellow', add=T, fill=T)

######################################
#
#mapproj 패키지를 이용한 그림그리기
#
######################################

install.packages("mapproj")
library(mapproj)

# 예제7 : 'worldHires' 맵 데이터베이스로 세계지도를 투영하여 표현하고
#         독도를 중앙으로 표시하고 그 위치에 'x'를 출력하기

#"독도"
# ==> lon : 131.8643, lat : 37.24223

m <- map("worldHires",plot=FALSE)
m
map("worldHires", proj='azequalarea', orient=c(37.24223,131.8643,180))
map.grid(m, col=2)
points(mapproject(list(y=37.24223,x=131.8643)),
			col = "blue", pch="o", cex=2)
title("지구본에서의 독도")

######################################
#
#ggmap 패키지를 이용한 그림그리기
#
######################################

install.packages('devtools')
library(devtools)
install_github('dkahle/ggmap')
library("ggmap")

# API_key<-'AIzaSyDkAesuSoezs8o0w6DqmkP1Mxxb-DDim8Y'
API_key<-'AIzaSyBy5kz2WtDWtyO8cYJkE5STgT5n8SSmrVk'

register_google(key=API_key)

# 예제1: 구글맵 지도를 가져와서 서울역 위치를 표시

# 서울역 위도와 경도

gc<-geocode('서울역,대한민국')

longitude <- 126.9707
latitude <- 37.55453

# 구글 맵에서 해당 위치의 맵 정보 가져오기
map<-get_googlemap("서울,대한민국",zoom=10,maptype="roadmap",
			markers=data.frame(longitude,latitude))

#- maptype : roadmap, terrian, terrian-background, satellite, hybrid, watercolor, toner 등이 있음


# 맵 그리기
ggmap(map)


##########################################################################
# 2. 서울시 각 구청 위치 표시하기
##########################################################################

library(ggplot2)

gu <- read.csv("example01_서울시구청위치정보.csv", header=T, fileEncoding = "CP949")
gu

gu2 <- get_map("seoul",zoom=11,maptype="roadmap")
ggmap(gu2)

gu.map <- ggmap(gu2) + geom_point(data=gu, aes(x=LON, y=LAT),size=4,alpha=0.6,color="green")  
gu.map
# size는 원의 크기, alpha 는 투명도, 위도(Latitude), 경도(Longitude)
gu.map + geom_text(data=gu, aes(x=LON, y=LAT+0.01, label=name), size=3)



##########################################################################
# 3. 하나의 맵에 여러 위치를 표시하기 
#    - 서울 지역별 장애인도서관 위치와 서울시 장난감 도서관 위치를 하나의 지도에 표시하기
##########################################################################

loc1 <- read.csv("example02_지역별장애인도서관정보.csv", header=T, fileEncoding = "CP949")
loc1

loc2 <- read.csv("example02_서울시장난감도서관위치현황.csv", header=T, fileEncoding = "CP949")
loc2

map <- 
ggmap(map)

kor.map <- 


kor.map




##########################################################################
# 4. 서울 지하철 2, 3호선 경로 표시하기 
#
##########################################################################

loc1 <- read.csv("example03_서울지하철2호선역위경도정보.csv", header=T, fileEncoding = "CP949")
loc1

loc2 <- read.csv("example03_서울지하철3호선역위경도정보.csv", header=T, fileEncoding = "CP949")
loc2

lab_name <- c("2호선","3호선")
lab_color <- c("green","red")
center <- c(mean(loc2$LON)-0.03, mean(loc2$LAT))

kor <- 
ggmap(kor)
kor.map <- 


kor.map



 

##########################################################################
# 5. 제주도 여행 코스 기록하기 
#
##########################################################################

jeju <- read.csv("example04_제주도여행코스_1일차.csv", header=T, fileEncoding = "CP949")
jeju

jeju1 <- 

ggmap(jeju1)

jeju.map <- 

jeju.map



