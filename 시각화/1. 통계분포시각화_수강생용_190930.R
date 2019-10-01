#########################
#
# working with graphs
#
#########################

mtcars
attach(mtcars)
plot(wt, mpg)
a<-lm(mpg~wt)         #mpg는 종속변수, wt는 독립변수
summary(a)
abline(lm(mpg~wt))    #회귀직선 긋기
title("Regression of MPG on Weight")
detach(mtcars)


#######################################################
###      그래프를 외부 파일에 저장
#
#     -> 이미지 저장 함수
#     win.metafile(), png(), jpeg(), bmp(), tiff(), xfig(), postscript() 
#
#     -> 출력 윈도우 조작 함수
#     dev.new(), dev.next(), dev.prev(), dev.set(), dev.off()
##########################################################


setwd("d:/R_edu_201909")
getwd()

pdf("mygraph.pdf")

attach(mtcars)
plot(wt,mpg)
abline(lm(mpg~wt))
title("Regression of MPG on Weight")
detach(mtcars)
dev.off()




## Not run: ## Unix-specific example

x11()       # 새로운 그래프 창을 생성
plot(1:10)

x11()
plot(rnorm(10))
dev.set(dev.prev())      #앞에 열어둔 창 지정
abline(0, 1)       # through the 1:10 points
dev.set(dev.next())      #뒤에 열어둔 창 지정
abline(h=0, col="gray")           # for the residual plot
dev.set(dev.prev())
dev.off() 
dev.off()               #- close the two X devices
## End(Not run)


####################################################
#
#      샘플 만들기
#
#####################################################


dose <- c(20, 30, 40, 45, 60)
drugA <- c(16, 20, 27, 40, 60)
drugB <- c(15, 18, 25, 31, 40)


# x축, y축, b=“포인트+연결라인”
plot(dose, drugA, type="b")
                              # A약 투여량과 반응을 표현한 간단한 라인 그래프

?plot()

###############################################################
#   
#
#  그래픽 매개 변수
#  par(optionname=value, optionname=value, ...)
##############################################################

#그래픽 매개변수는 그려진 그래프의 점, 선 등의 모양을 변화하는 것

?par()
par(new=TRUE)              # 하나의 새로운 창을 열기
par(mfrow=c(1,2))           # 1 x 2 pictures on one plot(행부터 그림이 그려짐)


opar<par(no.readonly=TRUE)
#- 그래프 모수를 설정할 때는 나중에 원래 그래프 모수로 돌아와야하는 
#- 상황에서 편리하게 사용하기 위해 사용

par(lty=4, pch=16)
plot(dose, drugA, type="b")

#x11()
par(opar)
#// par 따로쓰기
#par(lty=2)
#par(pch=17)
#// 해당 그래프에만 매개변수가 적용됨

plot(dose, drugA, type="b", lty=2, pch=10)



#################################################
#               색  color
#         rainbow(), c, terrain.colors(), 
#         topo.colors(), cm.colors()
###################################################

n<-10
mycolors<-rainbow(n)       #RGB 컬러명이 나옴
mycolors

pie(rep(1, n), labels=mycolors, col=mycolors)

x11()                     # 새로운 창 생성
mygrays <- gray(0:n/n)   #명암 수준을 나타내는 함수, 0~1까지로 나타내며 rgb로 나타냄
pie(rep(1, n), labels=mygrays , col=mygrays )

#######################################################
#
#    새로운 그래프 창에서 글씨체 관련
#
#######################################################
x11()
par(mfrow = c(2, 2))   
plot(dose, drugA, type="b", lty=2, pch=17)

par(font.lab=4, cex.lab=2)
#
#font.lab, cex.lab --> 1.5배 크기의 이탤릭체 xy축 레이블
plot(dose, drugA, type="b", lty=2, pch=17)


#windowsFontsd함수를 활용하면 window 내장 폰트를 불러와 활용이 가능함.
windowsFonts(
	A=windowsFont("Arial Black"),
	B=windowsFont("Bookman Old Style"),
	C=windowsFont("Comic Sans MS")
)
par(family="A")
#->  Arial Black 폰트 지정
plot(dose, drugA, type="b", lty=2, pch=17)

# pch : 점그래프의 점의 모양을 선택
# lty : 선의 종류를 선택
# lwd : 선의 두께
# cex : 점의 크기

################################################
#  여백  margin 정의
################################################

x11()

par(pin=c(4,3), mai=c(1,.5,1,2))
# pin - 인치를 설정, 4인치의 넓이와 3인치의 높이
# mai - 여백지정(inches), 아래, 왼쪽, 위, 오른쪽 순서로 여백 지정 가능

plot(dose, drugA, type="b", lty=3, lwd=2, pch=15, cex=2)

x11()
par(pin=c(4,3), mar=c(5,4,4,2)+1)
#mar - 여백지정(lines), 아래, 왼쪽, 위, 오른쪽 순서로 여백 지정 가능

plot(dose, drugA, type="b", lty=3, lwd=2, pch=15, cex=2)

x11()
dose <- c(20, 30, 40, 45, 60)
drugA <- c(16, 20, 27, 40, 60)
drugB <- c(15, 18, 25, 31, 40)

par(mfrow=c(1,2))          # 1 x 2 pictures on one plot

par(pin=c(2,3))             # 그래프의 넓이 2인치, 높이는 3인치 
par(lwd=2, cex=1.5)              #선의 굵기 2, 점의 크기 1.5
par(cex.axis=0.75, font.axis=3)       #축의 크기 75%, 축의 폰트는 이텔릭체 

plot(dose,drugA,type="b",pch=19,lty=2,col="red")
plot(dose,drugB,type="b",pch=23,lty=6,col="blue", bg="green")


#################################################
#
# PLOT 함수에 그래픽 설정 바로 적용
#
################################################


x11()
par(mfrow=c(1,2))

plot(dose, drugA, type="b", col="green", lty=2, pch=2, lwd=2,
	main="Main", sub="Sub", xlab="Dosage", ylab="Drug Response",
	xlim=c(0,60), ylim=c(0,70))

                                            #main: 본제목
                                            #sub : 부제목
                                            #xlab : x축 이름, ylab : y축 이름
                                            #xlim : x축 범위, ylim : y축 범위


######################################################
# 제목과 레이블의 색 지정   (실습)
######################################################
#  -> 빨간 제목과 파란 소제목, 그리고 기본 텍스트 크기보다 25% 작은 
#     녹색의 x와 y축의 레이블을 생성

plot(
	dose, 
	drugB, t
	ype="b", 
	col="red", 
	lty=2, 
	pch=2, 
	lwd=2,
	main="Main", 
	col.main="blue", 
	sub="Sub", 
	col.sub="orange", 
	xlab="Dosage", 
	ylab="Drug Response", 
	col.lab="gray", 
	cex.lab=0.75,
	xlim=c(0,60), 
	ylim=c(0,70)
)

                        #col.main : 본제목 글자의 색변경
                        #col.sub : 부제목 글자의 색변경
                        #col.lab : x, y축 라벨 글자의 색변경
     



#####################################################
# 축 표시에 대한 예제    (실습)
#####################################################

x11()
x<-c(1:10)
y<-x
z<-10/x

x
y
z

par(mar=c(5,4,4,8)+0.1)

#-yaxt는 y 축을 보이게 하는 인자,ylab=""는 y 레이블을 보이지 않게 하는 인자 
plot(x, y, type="b", pch=21,
	col="red", ylab="", yaxt="n", lty=3)

#- line 함수를통해 새로운 선을 그림
lines(x,z,type="b",pch=22,col="blue",lty=2)

axis(side=2, at=y, labels=y, col.axis="red", las=2)
axis(side=4, at=z, labels=round(z,digits=2), col.axis="blue", las=2,
	cex.axis=0.7, tck=-0.01)
#- side : 축을 어느위치에 그릴지를 정함, 1:아래, 2:왼쪽, 3:위, 4:오른쪽
#- at : 어느 변수의 축을 맞춰서 그릴지를 정함, y값이 1~10값이고 point가 찍힌 지점에 맞게 axis를 그림
#- label : 축의 label을 나타냄. y값 1~10값을 나타냄
#- col.axis : 축의 색을 나타냄
#- las : 축의 글자 방향을 나타냄, 2: Horizontal, 3: Vertical
#- cex.axis : 축의 글자 크기
#- tck : 축의 눈금줄의 길이

mtext("y=10/x", side=4, line=2, cex.lab=1, las=2, col="blue")
title("An example of Creative Axes", xlab="Xvalues", ylab="Y=X")
#- mtext 함수를 이용해 그래프에 글자를 추가할 수 있음
#- line : 글자의 위치를 나타냄

#보조 눈금 그리기
install.packages("Hmisc")
library(Hmisc)

minor.tick(nx=2, ny=3, tick.ratio=0.5)
#- minor.tick를 통해서 보조눈금을 그릴 수 있음.
#- nx는 x축, ny는 y축이며, tick.ratio로 주눈금과 보조눈금의 길이 비율을 나타냄

#####################################################
#             라인 생성하기
######################################################

x11()
x<-c(1:10)
y<-x
z<-10/x
par(mar=c(5,4,4,8)+0.1)

plot(x, y, type="b", pch=21, col="red",yaxt="n",lty=3)


abline(h=c(1,5,7))
# h : 가로 실선을 y=1,5,7에 추가

abline(v=seq(1,10,2), lty=2, col="blue")
# v : x = 1, 3, 5, 7, 9에 파란 세로 점선을 추가



#####################################################
#
#    범례 (legend)   표시하기   (실습)
#####################################################

x11()
dose <- c(20, 30, 40, 45, 60)
drugA <- c(16, 20, 27, 40, 60)
drugB <- c(15, 18, 25, 31, 40)


opar <- par(no.readonly=T)

par(lwd=2, cex=1.5, font.lab=2)

plot(dose, drugA, type="b",
     pch=15, lty=1,col="red", ylim=c(0,60), 
     main="Drug A vs. Drug B",
     xlab="Drug Dosage", ylab="Drug Response")
lines(dose,drugB, type="b", pch=17, lty=2, col="blue")
abline(h=c(30), lwd=1.5, lty=2, col="gray")

install.packages("Hmisc")
library(Hmisc)
minor.tick(nx=5, ny=5, tick.ratio=0.5)

legend("topleft", inset=0.01, title="Drug Type", c("A", "B"),
	lty=c(1,3), pch=c(15,17), col=c("red", "blue"))

#- "topleft"는 상단 왼쪽에 지정하겠다는 뜻임. 
#- inset : 범례가 위치하는 곳에 일정 부분을 띄워서 겹치지 않게 출력하게함.

par(opar)



############################################################
#     도표내에 글자를 표시하기   (실습)
############################################################
x11()
mtcars
attach(mtcars)
plot(wt, mpg,
     main="Mileage vs. Car Weight",
     xlab="Weight", ylab="Mileage",
     pch=18, col="blue")
abline(lm(mpg~wt))

text(wt, mpg, row.names(mtcars), cex=0.6, pos=4, col="red")

detach(mtcars)


############################################################
#     도표내에 글자를 표시하기   (실습)
############################################################
### 2019-09-30 16:43

x11()
par(cex=1.5)
plot(1:7,1:7,type="n")    #type="n"은 그래프에서 표시가 되지 않음
text(5,6,"aaaaaaaaaaaaaa")
text(4,4,family="mono","bbbbbbbbbbbbbbbb")
text(5,5,family="serif","cccccccccccccccccccccccccccccccc")



############################################################
#        combining graphs 도표내 그림 표현하기   (실습)
###########################################################
x11()
attach(mtcars)
opar <- par(no.readonly=TRUE)
par(mfrow=c(1,4))
plot(wt,mpg)
plot(wt,disp)
hist(wt)
boxplot(wt)
par(opar)
detach(mtcars)
par(opar)
detach(mtcars)

attach(mtcars)
opar <- par(no.readonly=TRUE)
par(mfrow=c(3,1))
hist(wt)
hist(mpg)
hist(disp)
par(opar)
detach(mtcars)

attach(mtcars)
layout(matrix(c(1,1,2,3), 2,2,byrow=TRUE))
#- layout : 한 창에 그래프를 여러개 나타낼 수 있게함.
hist(wt)
hist(mpg)
hist(disp)
detach(mtcars)

x11()
attach(mtcars)




detach(mtcars)



#####################################################
#
#  그래프내에 그래프 추가하기    (실습)
#
######################################################

x11()
par(fig=c(0,0.8,0,0.8))
#- fig : x축은 0~0.8, y축은 0~0.8로 지정

attach(mtcars)
plot(wt,mpg,xlab="Miles per Gallon", ylab="Car Weight")

par(fig=c(0,0.8,0.55,1),new=TRUE)
boxplot(wt,horizontal=TRUE, axes=FALSE)

par(fig=c(0.65,1,0,0.8),new=TRUE)
boxplot(mpg, axes=FALSE)

mtext("Enhanced Scatterplot", side=3, outer=TRUE, line=-3)
detach(mtcars)






########################################################
#
#   다양한 차트의 실습하기
#
########################################################


install.packages("vcd")       # 신약 처방과 관련된 데이터셋
install.packages("plotrix")   # 3D 파이 차트
install.packages("sm")        # 밀도 그래프
install.packages("vioplot")   # 바이올린 그래프


# --  vcd 패키지 로딩하고 데이터셋 보기
library(vcd)
Arthritis
?Arthritis
str(Arthritis)
# --  Bar Plot을 그리기 위한 집계 데이터셋 만들고 확인하기
counts<-table(Arthritis$Improved)
counts

# --  기본 Bar Plot 그리기( 세로 )
x11()
barplot(counts,
	main="기본 바 플롯",
	xlab="약효 구분", ylab="빈도수")




# --  가로 Bar Plot 그리기( 가로 )
x11()
barplot(counts,
	main="기본 바 플롯",
	xlab="약효 구분", ylab="빈도수",
	horiz=TRUE)



                               #horiz=TRUE는 가로로 Bar Plot를 그림



# table 사용하지 않고 그리기



############## pie test ##################

n<-10
mycolors<-rainbow(n)       #RGB 컬러명이 나옴
mycolors
x11
pie(
	counts, 
	labels=rownames(counts), 
	col=c("red","orange","yellow"),
)

###############################################

##########################################################
#   누적 막대 그래프 
##########################################################

# Stacked Bar : 누적
counts2<-table(Arthritis$Improved, Arthritis$Treatment)
counts2
### 범주형 자료를 그릴 때는 table을 사용함.
x11
opar <- par(no.readonly=TRUE)
par(mfrow=c(1,2))



barplot(counts2,
	main="Stacked Bar plot",
	xlab="처방구분", 
	ylab="빈도수",
	col=c("red","orange","yellow"),
	ylim=c(0,60),
	legend=rownames(counts))



# 막대 그래프 나누어서 표기
barplot(counts2,
	main="Stacked Bar plot",
	xlab="처방구분", 
	ylab="빈도수",
	col=c("red","orange","yellow"),
	legend=rownames(counts),
	beside=TRUE)

                                  # beside=TRUE로 막대그래프를 나누어서 볼 수 있음


par(opar)


#실습
#1. 색상을 변경해보세요.
x11
barplot(counts2,
	main="Stacked Bar plot",
	xlab="처방구분", 
	ylab="빈도수",
	col=c("red","black","yellow"),
	legend=rownames(counts),
	beside=TRUE)

#2. Y축의 좌표값 기준을 변경해서 범례가 겹치지 않도록 하세요.
x11
barplot(counts2,
	main="Stacked Bar plot",
	xlab="처방구분", 
	ylab="빈도수",
	col=mycolors,
	legend=rownames(counts2),
	ylim=c(0,30),
	beside=TRUE)

#- 힌트
# n <- 10
# mycolors <- heat.colors(n)
# mycolors <- terrain.colors(n)
# mycolors <- topo.colors(n)
# mycolors <- cm.colors(n)
# mycolors <- rainbow(n)
# ylim=c(0,70)
# xlim=c(0,50)

#- 정답
x11()
n <- 3
mycolors <- heat.colors(n)

barplot(counts2,
	main="Stacked Bar plot",
	xlab="처방구분", 
	ylab="빈도수",
	col=mycolors,
	legend=rownames(counts2),
	ylim=c(0,30),
	beside=TRUE)






######################################################
#          막대 그래프 만들기 (세로) 실습
######################################################

?state

state.region
state.x77
# 데이터셋 만들기( 기본 패키지 : 미국 주별 통계치 데이터셋)

states <- data.frame(state.region, state.x77)
summary(states)

states[,c(1,2)]   #state.region과 Population만 추출
states[c(1,2)]

#- 집계함수(aggregate)로 states의 Illiteracy의 값을 state.region별로 평균을 구함
mean_f <- aggregate(states$Illiteracy,
				by=list(state.region),
				FUN=mean)

# 정렬하기
                                    #order 함수로 정렬, decreasing=T이면 내림차순으로 정렬
mean_f <- mean_f[order(mean_f$x), ]

mean_f
(mean_f[,2])

# Bar plot 그리기
x11()
barplot(mean_f$x, 
        names.arg=mean_f$Group.1, 
        col=c("red","yellow","green","blue") )
title("지역별 문맹률(%)")



######################################################
#          막대 그래프 만들기 (가로) 실습
######################################################

#Arthristis 데이터셋의 Imporved변수로 가로 막대그래프를 그려라.
#각 bar의 이름은 None="효능없음", Some="약간",Marked="상당한 효능"으로 지정하여라

x11()
library(vcd)
Arthritis

#정답
# --  Bar Plot을 그리기 위한 집계 데이터셋 만들고 확인하기







############################
#     누적막대그래프
############################


attach(Arthritis)
counts2 <- table(Treatment, Improved)

#-spine : vcd 패키지에 포함된 함수로 색깔이 구분안되는 단점이 있음

detach(Arthritis)



######################################################
#          파이 그래프 만들기 
######################################################

# 캔버스를 4등분( 2 X 2 )
par(mfrow=c(2, 2))

# 데이터셋
slices <- c(10, 12,4, 16, 8)
lbls <- c("미국", "영국", "호주", "독일", "한국")  

# 기본 파이 차트 그리기
pie(slices, labels=lbls, main="pie!")


# 라벨 변경하기 : 100% 비율로( 카테고리 이름 + XX% )
pct<-round(slices/sum(slices)*100)
lbls2 <- paste(lbls, " ", pct,"%", sep="")

#- paste : 글자를 붙여주는 함수

pie(slices, 
	labels=lbls2,
	col=rainbow(length(lbls2)),
	main="pie pct")


# 3차원 파이 차트 그리기
library( plotrix )
pie3D(slices,
	labels=lbls2,
	main="3D")

# 라벨 변경하기 : 카테고리 이름 + 빈도수
mytable <- table(state.region)

lbls3 <- paste(names(mytable), "\n", mytable , sep="")
pie(mytable, label=lbls3, main="pie usa")

##### 라벨 변경하기 : 100% 비율로( 카테고리 이름 + XX% )
pct2<-round(mytable/sum(mytable)*100)
lbls4 <- paste(pct2,"%", sep="")

lbls3 <- paste(names(mytable), "\n", lbls4 , sep="")
pie(mytable, label=lbls3, main="pie usa")

######################################################
#         부채 그래프 만들기 
######################################################

# 캔버스를 하나로 
par(mfrow=c(1, 1))
# 파이 차트 대신 Fan Plot으로 그리기





######################################################
#        히스토그램 만들기 
######################################################


par(mfrow=c(2,2))

summary(mtcars)

#1번째 : 기본 Histogram 그리기
hist(mtcars$mpg)

#2번째 : 색상을 추가하고, 12 단계로 구간을 분할 합니다.
hist(mtcars$mpg,
	breaks=12,
	col="red",
	xlab="MPG/Miles Per Gallon",
	ylab="빈도수",
	main="Hist MPG"
)
#- break : 구간을 나누는 인자

#3번째 : Rug Plot과 Density Curve



#- rug : 실제 데이터의 위치를 x축위에 표시
#- jitter : 데이터 중첩이 많다면 jitter를 통해 약간의 노이즈를 발생시켜 값이 구분되도록 함.



#4번째 : 정규 곡선과 테두리


#- seq함수로 x 데이터의 최소값부터 최대값까지 40개의 구간으로 나눔



#- dnorm : 정규분포 확률밀도함수 값을 구해줌. xfit값을 평균이 mean(x)이고 표준편차가 sd(x)인 값으로 확률밀도함수값을 구함.



#- diff : 관측값에서 직전 관측값을 뺀 차분을 구하는 함수


box()



######################################################
#        핵밀도 그래프 만들기 
######################################################

x11()
# 캔버스를 2 X 1로 나눔 
par(mfrow=c(2,1))

# 1번째 : 기본 밀도 그래프 그리기
d <- density(mtcars$mpg)
plot(d)

# 2번째 : Area Line Chart + rug 띠 표시
polygon(d, col="green", border="blue",lwd=3)
#- col : 그래프 내부의 색을 지정
#- border : 그래프 외부 선의 색 지정
rug(mtcars$mpg,col="brown",lwd=1.5)

?rug
######################################################
#        밀도 비교 그래프(카탈로그별 )비교 
######################################################


par(lwd=2)
library(sm)   
attach(mtcars)
par(mfrow=c(1,1))

# 실린더별(4,6,8기통) 밀도 비교 그래프
cyl.f <- factor(
	cyl, 
	levels=c(4,6,8),
	labels=c("4기통","6기통","8기통"))
sm.density.compare(mpg,cyl,xlab="MPG")

#- mpg에 따른 cyl의 밀도그래프를 그림

title(main="실린더별 MPG 분포")
colfill<-c(2:(1+length(levels(cyl.f))))
#cyl 범주별 색을 추가하기 위해 colfill추가

# 범례를 그리는데 마우스로 클릭한 곳에 
legend(locator(1), levels(cyl.f), fill=colfill)
detach(mtcars)



######################################################
#        박스 수염 그래프 
######################################################


x11()
# 기본 Box 그래프 그리기
par(mfrow=c(1,1))



# 카테고리별 Box 그래프







######################################################
#        박스 수염 그래프에 (가위집 내기) 
######################################################




                           #notch를 통해 박스의 가위집을 냄
                           #varwidth=TRUE를 통해 관측치 수의 비율에 맞는 너비로 그려짐









######################################################
#        기본 박스 수염 그래프 확장하기 
#        색상을 이용하여 2개 그룹의 분포로 표현
######################################################

#cyl.f 변수 추가하기



#am.f 변수 추가하기





                                 #mpg 값을 am.f와 cyl.f 변수에 따라 박스 그래프 생성







######################################################
#        기본 박스 수염 그래프 확장하기 
#        색상을 이용하여 2개 그룹의 분포로 표현
######################################################

# 바이올린 그래프
# = Box Plot + Kernel Density Plot 
# 실전에서는 별로 사용되지 않음


library(vioplot)

#각 조건에 맞는 값을 x1, x2, x3에 저장
                                   #cyl이 4인 mpg 값을 x1에 저장
                                   #cyl이 6인 mpg 값을 x2에 저장
                                   #cyl이 8인 mpg 값을 x3에 저장





title("바이올린 그래프 - 실린더별 연비")




######################################################
#       점 그래프의 특징 표현
######################################################

# 모든 값을 점으로 표현
# 1차원 변수로 각 데이터는 Y축에 X축은 데이터의 값








######################################################
#       점 그래프 (정렬+그룹별로 색을 달리하기)
#####################################################



                                        # mpg값을 기준으로 정렬
x








#- cyl 값에 따른 색부여




                                      # 4기통, 6기통, 8기통 그룹에 따른 값을 나타냄





