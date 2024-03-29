
##########################################R 프로그래밍 기초 ####################################################
############# 1. R 기초
# R 둘러보기   ###

7+5+6+4+7+8+12
a <- c(7,5,6,4,7,8,12)
mean(a)
median(a)

# Create the function.
getmode <- function(v) {
  uniqv <- unique(v)
  uniqv[which.max(tabulate(match(v, uniqv)))]
}

getmode(a)


###### 작업 공간 할당하기 ###


 
getwd()
setwd("d:/R_edu_201909")





#### 커맨드 입력하기  ######

1+1 


# 불완전한 커맨드 입력
max(4,6,8), max(4,6,
)


# 여러줄을 한꺼번에 실행
a<-1+1; b<-a/2


# 스크립트 활용하기  #

rnorm(20)
a<-rnorm(20)


# 도움말 기능 활용하기   #

help.start()  
help(max) 
?max
RSiteSearch("max") 



# 명령어 히스토리 활용하기  # 

#예를 들어서 아래와 같은 명령어들을 실행시켰다면
ls()
a<-rnorm(20)
b<-hist(a)

                                # 위의 명령어들을 다시 불러들인다
                                # 명령어 히스토리를 저장(working Directory에 저장됨)
                                # 명령어 히스토리 불러오기




# 패키지  활용하기  # 

                              #현재 활성화된 패키지들이 무엇인지 확인


                              #하드디스크에 MASS 패키지를 실행하지 않았기 때문에 파일이 없는것으로 나옴

                              #MASS 패키지를 라이브러리에 설치
                              #데이터 확인 가능




                              #하드디스크에 존재하지 않는 boot 패키지 다운로드 및 설치

                              #다운로드 된 boot 패키지의 help 다큐먼트를 보여줌
                              #웹을 통해 boot 패키지의 다큐먼트를 보여줌
                              #웹을 통해 boot 패키지의 다큐먼트를 보여줌



## R 프로그램 파일 실행   ##

source("a.R")




######### 2. 입력과 출력###############
#########    출력하기   ###############
#######################################

pi
sqrt(2)

print(pi)
print(sqrt(2))

                                    # 3 x 2
                                    # 2 x 3



#print함수는 오로지 하나의 객체만 프린트

print("THe zoro occur at", 2*pi, "radians.") #error 발생



#cat함수는 print의 대안으로 여러개의 항목을 묶어서 연결된 결과로 출력해줌

  

#cat함수는 간단한 벡터도 출력 가능

f<-c(0,1,1,2,3,5,8,13)                          


#cat함수의 한계는 행렬이나 리스트 같은 복잡한 데이터 구조를 출력할 수 없음

cat(list("a","b","c"))                         


#######    변수 설정하기   ##############
######################################
# 대입연산자 (<-)

x<-3                                      
y<-2
z<-sqrt(x^2+2*y)
z

#R은 동적 타입 언어이다.

x<-c("a", "b", "c", "d")                   
x












#변수 목록 보기






     

#변수 목록 뿐아니라 구조를 보여주는 함수

ls.str()                 


                         # 변수 삭제 , 한번 변수를 삭제하면 영원히 삭제 됨
                         # 한꺼번에 변수 삭제 가능
ls()


# warning 변수 목록을 리스트 인자에 지정한 다음 삭제하게 됨에 따라 기존에 있는 모든 변수를 삭제하게 됨 조심해야 함.



ls()

#######  벡터 생성하기  ##############
######################################

#R 프로그램에서 사용하는 가장 기본적인 데이터셋의 형태







d<-
e<-
f<-

#벡터의 인자 자체가 벡터인 경우 벡터를 풀어서 하나로 합친다.

g<-
g

#벡터의 인자 중 하나라도 문자가 포함되어 있는 경우 모든 원소들은 문자형으로 정의 된다.

h<-
h





####### 기본적인 통계량 계산하기  ###########
#######################################


a<-c(0,1,1,2,3,5,8,13)
b<-log(a+1)
c<-c(0,1,1,2,3,5,8,13,NA)

#평균



#중앙값                



#표준편차     



#분산                       



#상관계수   



#공분산       



#평균, 중간값, 표준편차는 데이터 프레임에서 각 변수들을 기준으로 값을 산출
#분산은 공분산 행렬을 제공, 상관계수는 상관계수 행렬을 제공


## 단하나의 NA 값이 포함되어도 결과는 NA로 나오므로 아래와 같이 활용

mean(c)
sd(c)




hei<-c(187,178,176,169,181,172)

wei<-c(82,72,70,65,74,68)















####### 수열 생성하기  ##############
##################################

1:10

# by의 디폴트는 1





            # 0~9
            # 5~10
            # 9~0


# 수열의 길이를 지정하고자 할때, length.out 사용









############ 벡터의 비교  ##############
####################################
















                     #벡터의 값들 중 하나라도 같은가?
                     #벡터의 값들이 모두 같은가?   all(z==0) 모든 값들이 0인가?는 많이 활용된다.






############ 벡터에 있는 원소 선택하기  ########
###########################################

a<-c(0,1,1,2,3,5,8,13)
a










# 인덱스가 음수인 경우는 1번째 값을 제외하라는 의미




# 중앙값보다 큰 모든 원소를 선택




# 상하위 5% 안에 있는 모든 원소를 선택



# 평균에서 + - 표준편차를 넘는 모든 원소 선택

 
  

# NA나 NULL이 아닌 모든 원소를 선택

  
 










############    벡터 연산 수행하기      ########
###########################################

v1<-c(10,11,12,13,14)
v2<-c(1,2,3,4,5)



















############    연산자 우선순위       ########
###########################################


#PPT 참조




############     R  함수 정의        ########
###########################################
#
#   function(매개변수1, 매개변수2, 매개변수3,....) expr
#
#   function(매개변수1, 매개변수2, 매개변수3,....) {
#        expr1
#        expr2
#        expr3
#        .....
#        }
#
##############################################?


f1<-                                #정규분포를 표준정규분포로 표준화
f1(1:10)


skew.and.kurto <-function(x)        #왜도와 첨도를 구하는 함수
{

  
  
  
  
  
  
}


t5<- 1:1000                    #1000 random obs from t with df 5
skew.and.kurto(t5)


#########  데이터 입력하기  ############
####################################


#키보드로 데이터를 입력할 때 conbine 함수를 사용



#빈 데이터 프레임을 만든 뒤 내장된 편집기를 불러와 데이터 입력

temp<-data.frame()                  



b

#메뉴->edit->data editor -> object명 입력                                 


# 간단한 문제를 다룰 때는 데이터 파일을 생성하고 읽어오는 것이 귀찮습니다.
# 이럴때는 R에 데이터를 곧바로 입력하는 게 편리하합니다.
# 이러한 방법을 위해 데이터 프레임을  정의하고 c함수로 벡터 생성해서 데이터를 입력해 봅시다.

c<-
  
  
  

c




#########  데이터 자리수 조절 ############
####################################
# R을 기본적으로 부동소수점을 포함해 7자리를 표시

pi                        

# 자리수를 4자리로 표현



cat("pi 값은 ", pi,"입니다.", "\n")

# cat 함수는 형식 조정 불가->format 함수 활용

 

# 옵션함수를 활용해서 digit의 기본값을 바꾸기



pi


#########  파일에 출력하기  ############
####################################

a<-sqrt(10)



# sink("fileout2.txt")    
#- 결과를 txt 파일과 pdf로 출력함





























#########  파일 목록보기  ############
####################################

                             #워킹 디렉토리의 파일을 확인할 수 있음.

                             #하위 디렉토리의 숨겨놓은 파일(마침표로 시작하는 파일)까지 모두 볼수 있음

   





#########  윈도우에서 'cannot open file 해결하기  ############
##########################################################



# d:\dataedu\R\basic\exam1.txt   위도우에서 파일이 있음을 알고 있다.
#하지만 

 
# 역슬레쉬(\)가 이름에 포함되어 있으면 문제가 발생
# 역슬레쉬 뒤에 오는 모든 문자를 이스케이프 처리한뒤 d:dataeduRbasicexam1.txt 로 인식

# 윈도우에서 R은 슬러쉬(/)를 역슬레쉬와 똑같이 취급하므로 문제 해결
  


#R에서는 역슬레쉬 (\\)를 역슬레쉬 (\)로 인식하여 취급하므로 문제 해결

  




############고정데이터 불러오기####################
###############################################

# f2<-read.fwf("exam2.txt", widths=c(w1,w2,w3,w4))   고정 자리 데이터 읽기  

#1째는 과제제출여부, 2째는 점수 사이에는 2칸의 빈칸

 

                                        # col명 지정

f2





###########비고정데이터 불러오기#############################

# (탭 또는 공백으로 구분된 )텍스트 파일로 된 테이블형식의 데이터 불러오기
# 각 줄이 하나의 레코드
f3<-  
f3    
# 하나의 레코드 내에서, 공백, 탭, 쉽표 등 한글자 짜리 구분문자                                     
# f3<-read.table("kings.txt", sep= :, )   
# 각 레코드ㅡ 동일한 수의 필드를 가짐


class(f3$V1)

# 문자열 레코드값을 factor로 인식하지 않고 문자열로 인식하게 함

f3<- 
f3 
class(f3$V1)

f3<-                                  # SAS의 결측값(.) 형태의 데이터를 NA 형태로 결측값을 변경
f3


# csv 파일은 R, 엑셀, 다른 스프레드시트 프로그램, 데이터베이스 관리자들이 자주 사용하는 형식

f4<- 
f4
class(f4$ename)


#탐색기를 통한 데이터 파일 불러오기

file.choose<-
head(file.choose)




########### csv 파일 출력하기 ############################
######################################################

  



############ HTML 테이블 읽어오기 ############################

####세계 500대 기업 리스트#
install.packages(c("XML","httr","RCurl"))
library(XML)
library(httr)
library(RCurl)






############ 복잡한 구조 파일 읽어오기 ############################

# 구조가 복잡하여 10줄만 읽고 멈춤

# l1<-readlines("exam1.txt",n=10)                

# 변수를 숫자형으로 인식하고 읽어들임


l2

#scan()에 활용되는 인자
#what=numeric(0)   다음 토큰은 숫자로 해석
#what=integer(0)   다음 토큰은 정수로 해석
#what=complex(0)   다음 토큰은 복소수로 해석
#what=character(0) 다음 토큰은 문자열로 해석
#what=logical(0)   다음 토큰은 논리값으로 해석


#n=number         이만큼의 토큰을 읽은 다음에 멈춤
#nlines=number    이만큼의 입력 라인을 읽은 다음 멈춤
#skip=number      데이터를 읽기 전에 건너 뛰는 입력 라인의 개수
#na.strings=list  NA로 해석될 문자열 리스트


# 예제 1. 경주시외버스터미널 가격표
# 문자와 숫자가 조합된 형태의 데이터 읽기


l3<-scan("gyeongju_ternimal.csv",what=list(des=character(0), fare=numeric(0)),skip=1,sep=",")
  
gyeongju<-as.data.frame(l3)
gyeongju

?l3<-scan("gyeongju_ternimal.csv",what=list(des=character(0), fare=numeric(0)),skip=1,sep=",")


########### 객체를 저장하고 전송하기 ######################
######################################################


save(gyeongju,file="myData.RData")          #save함수는 바이너리 데이터를 작성, ASCII 형식은 dput, dump를 사용

load("myData.RData")

                                                #변수 앞뒤의 따움표에 주의

dput("myData", file="myData.txt") 
dump("myData", file="myData.txt")

#save함수는 파일의 크기를 작게 유지하기 위해 바이너리 형식으로 저장한다. ASCII 형식은 dput, dump를 사용할 수 있다.

#메일링 리스트에 질의를 보낼때 다른 사람들이 문제를 재현하기 위해서 ASCII 형식의 데이터의 덤프를 첨부 할 수 있다.

#프로그램에서 데이터가 특정 패키지에 있는 데이터를 활용한다면 패키지를 로딩해 두어야 활용할 수있다.

# 9/29 10:00



############# 3. 데이터 구조와 데이터 프레임(1)
#########  데이터 구조   ############
####################################

#불러들인 csv 데이터를 데이터프레임에 적용

a<-read.csv("frame.csv", header=T)
str(a)
a
b<-as.data.frame(a)  
b
c<-as.vector(b["phone"])
c


#1번째 리스트를 프린트

b[1]

#1번째 리스트내의 값들을 프린트

  b[[1]]


# 항목과 그 값들을 프린트

b[1]
b["empno"]

# 항목명을 통해서 값들을 프린트
b["empno"]
b$empno


#1행, 2열에 해당하는 원소

 b[1,2]

#2행에 해당하는 모든 원소

 b[2,]

#2열에 해당하는 모든 원소

b[,2]


###### 단일값  ######
#단일값은 원소가 하나인 벡터로 의미

pi

length(pi)
length(b$empno)
pi[1]
pi[2]

####### 행렬  #########
#차원을 가지고 있는 벡터로 인식하면 됨

a<-1:9
a
dim(a)<-c(3,3)
a

# c == combine

####### 배열  #########



b<-1:12

dim(b)<-c(2,3,2)
b


####### 벡터에 데이터 추가와 삽입 ##########

  

#벡터에 단일값 삽입 

    
v1 <- c(1,2,3)
v1 <- c(v1, 4, 5)
v1
v2 <- c(6,7,8,9,10)

v2
#벡터에 다른 벡터를 삽입

v1 <- c(v1,v2)  
v1

#벡터의 특정위치에 단일값 삽입

  
v1[12]<-12
v1


#벡터의 특정 위치에 단일값 삽입


v1
v3 <- append(v1,100,after=5) 
v3


#벡터의 특정 위치에 데이터 삽입

v4 <- append(v1,v2,after=0)  

v4

append(v1,v2,after=1)


#col 값을 벡터로 연결

c1<- cbind(1:6) 
c1

# 데이터를 결합할 때 사용하는  함수
# 
# cbind : 열 결합, # column 
# rbind : 행 결합. # row

c1           
c2<-cbind(1:3)
c2
cbind(1:6, 1:3)

# recycling rule

#두개의 벡터를 col으로 연결

cbind(1:6, 1:3)

#두개의 object를 연결할 때는 길이가 같아야 함
cbind(c1, c2)
c3 <- cbind(1:6, 1:3)
cbind(c3,c1)
### 2019-09-29 10:54
###### recycling rule  ########

a<- c(1,2,3,4,5,6,10)
b<- c(7,8,9)
a+b



# 함수에도 재활용 규칙은 적용된다.




##########  요인 생성   #########
###############################
#
#연속형 변수를 범주형변수로 변경

f<- factor(c2) 
f
#범주형변수에 데이터 삽입

f<- factor(c("A","A","A","B","B","C","A","A","C","B","A","A"))
f

#범주형변수에 레벨을 정의

f<-factor(f,c("A","C","D","E","F"))
f


############## 리스트 생성하기 ######################

# 리스트는 각 원소의 모드가 달라도 되는 특징이 있음

l<-  list(3.14, "Tom", c(1,2,3,4), mean)
l

l[[3]][3]

# 빈 리스트를 생성하고 원소를 채워 넣는 방법으로 리스트 생성

l1<-list()                                   

l1[[1]] <- 2.714
l1[[2]] <- "TY"
l1[[3]] <- c(5,6,7)
l1[[4]] <- mean

l1[3]
l1[[3]]
l1[c(2,3)]


# 리스트의 원소에 이름을 붙일 수 있음

l2<- list(mid=1.1, far=1.5, more.far=2.0)
l3<- list(msadasdid=1.1, fasdsadar=1.5, mosadsadsadre.fsadsadsadar=2.0)

l2
l3

# 자리수로 리스트의 원소를 선택하기
l2[[1]]
l2[1]
l2[c(1,2)]


# 리스트의 구조를 확인해 보기->numeric

class(l2[[1]])
mode(l2[[1]])

# 리스트의 구조 확인해 보기 ->list                  

class(l2[1])
mode(l2[1])

class(l2)
mode(l2)


# 원소의 이름으로 리스트의 원소를 선택하기

### 2019-09-29 11:16




# 리스트에서 원소를 제거하기

  
l2


l3<-                                              # 리스트의 원소에 NULL 이 포함되어 있을 때 삭제하기
l3

                                                  # 리스트의 원소의 값이 NULL인 원소를 삭제
l3



###### 리스트에서 원소 제거하는 다양한 방법  #######


                                                  # 리스트의 원소가 0인 원소를 제거
                                                  # 리스트의 원소가 na인 원소를 제거
                                                  # 리스트의 원소가 절대값이 1보다 작은 원소를 제거
# abs 함수는 list를 다루지 못하므로 에러 발생





##########  행렬의 초기 내용 설정과 연산   #########
##############################################

#벡터를 생성

rowm1<-c(1.1,1.2,1.3,1.4,2.4,2.3)        
rowm2<-c(3.1,3.4,3.6,4.1,4.3,4.7)
rowm3<-c(1.1,1.2,1.3,3.1,3.4,3.6,4.1,4.3,4.7)

#벡터의 데이터를 2x3 행렬로 변경,,, 디폴트는 열을 기준으로 입력됨
m1<- matrix(rowm1,2,3)
m1 

#벡터의 데이터를 3x2 행렬로 변경,,, 디폴트는 열을 기준으로 입력됨

m2<- matrix(rowm2, 3,2)
m2

#벡터의 데이터를  행을 기준으로 2x3 행렬로 변경 
m3<- matrix(rowm3, 3,3,byrow=T)
m3
m3<- matrix(rowm3, 3,3,byrow=F)
m3

# 2x2 행렬을 0으로 초기화한 행렬 생성
m4<-  matrix(0,2,2)
m4

# 2x2 행렬을 NA으로 초기화한 행렬 생성
m5<- matrix(NA,2,2)
m5

# 벡터의 구조를 행렬구조로 변경하여 행렬을 생성
dim(rowm3)<-c(3,3)
rowm3 

r1<-c(1,2,3,4,5,6)        
r2<-c(6,5,4,3,2,1)
r3<-c(1,2,3,4)

r1<-matrix(r1, 2,3)
r2<-matrix(r2, 3,2)
r3<-matrix(r3, 2,2)
r1
r2
r3

### 2019-09-29 11:28

###### 행렬의 연산  ##################

# 전치행렬을 구함
t(r3) #transpose(r3)

# 역행렬을 구함
solve(r3)

# 행렬의 곱 구함
r1%*%r2

#2차 단위행렬을 구함

diag(5)

######### 행렬의 열과 행에 이름 붙이기   ###############

# 행렬의 행에 이름붙이기

rownames(m1)<-c("class A", "class B")  
m1

# 행렬의 열에 이름붙이기
colnames(m1)<-c("min_d","dis","max_d")
m1

######### 행렬의 열과 행 선택하여 하위행렬 생성   ###############

#m1 행렬에서 1행을 뽑아 벡터 vm1 생성
  
vm1<-m1[1,]

#m1 행렬에서 2열을 뽑아 벡터 vm2 생성
 
vm2<-m1[,2]

#m1 행렬에서 1행을 뽑아 하위행렬 sm1 생성

sm1 <- m1[1, , drop=TRUE]
sm1   
sm1 <- m1[1, , drop=FALSE]
sm1   

#m1 행렬에서 2열을 뽑아 하위행렬 sm2 생성

sm2<-m1[,2, drop=FALSE]  
sm2

### 2019-09-29 11:41

############# 4. 데이터 구조와 데이터 프레임(2)
######### 데이터 프레임 만들기  ########

# 벡터와 요인이 혼합된 데이터라면 data.frame 함수를 사용해서 조립
##  dfm<-data.frame(v1,v2,v3,f1,f2)            

# 데이터가 리스트 구조라면 as.data.frame 으로 재설정 가능
#  dfm<-as.data.frame(list.of.vectors)       

#벡터 생성
level<-c("low","mid","high")
lbound<-c(0.1,0.5,1.5)
ubound<-c(0.5,1.5,2.5)

#벡터를 데이터프레임으로 변환
dfm1<-data.frame(level,lbound,ubound)
dfm1                                           

#외부 데이터를 불러와 어브젝트에 할당
a<-read.csv("frame.csv", header=T)             
a
str(a)

a$ename<-as.character(a$ename)
a$phone<-as.character(a$phone)

# 외부 데이터가 리스트 구조임에 따라 구조 변경으로 데이터를 데이터프레임에 적용
k<-as.list(a)
k
dfm1<-  as.data.frame(a)
dfm1
str(dfm1)


#오브젝트의 내용 중 필요한 변수만 선택해서 data.frame 형식으로 재 구성

dfm2<-data.frame(a$empno, a$ename, a$deptno)
dfm2                                           

# 열의 이름을 적용하여 data.frame 형식으로 재 구성

dfm2<-  data.frame(empno = a$empno, ename = a$ename, deptno = a$deptno)
dfm2                                     


# 개별 벡터로 정의된 데이터들을 리스트로 구조를 변경하고 데이터 프레임형식으로 적용  

lst<-list(a1=a$empno, a2=a$ename, a3=a$deptno, a4=a$phone)
lst
lst1<-
lst1







#하나의 데이터를 리스트구조로 셋팅

a5<-  list(a1=10011, a2="
a5

#기존의 데이터 프레임에 a5를 추가

lst                                                      
lst1<-

#추가할 행 정보를 데이터프레임 형식으로 정의

newrow<- 

#행 결합을 통해 2개의 데이터 프레임을 결합

lst1<-  
lst1

# 다른 표현으로   

lst1<-
  
  
  
lst1



# 데이터 프레임 할당하기
#1,000,000개의 행과 3개의 열(2개는 수치형, 1개는 문자형)으로 데이터 프레임을 할당


N<-1000000
dtfm<-data.frame(no=numeric(N), name=character(N), score=numeric(N))
dtfm

head(dtfm)


#데이터프레임 내 2번째 원소를 선택

                                      

#데이터프레임 내 2번째 원소내 리스트를 선택

 

# 데이터프레임내 2번째 행원소를 선택




# 데이터프레임 내, 모든 행과 1,3번째 열을 선택
  



##  subset(데이터 프레임,select=c(열이름, 열이름,...)) 으로 쉽게 데이터 선택
##  subset(데이터 프레임,select=c(열이름, 열이름,...),subset=(열이름>조건))

lst<-as.data.frame(k)
lst

lst1<-subset(lst,select=-phone)
lst1

lst1<-subset(lst,select=c(empno, deptno))
lst1

lst1<-subset(lst,select=c(empno, deptno), subset=(deptno==30))
lst1

lst1<-subset(lst,subset=(deptno==30))
lst1







##############           연습 문제           #############
#        MASS 라는 패키지 내 Cars93 데이터셋에서         #####
# 1) city 에서 갤런당 30마일 이상 주행하는 연비를 가지는 차를 선택 #
# 2) 고속도로에서 MPG 값이 중앙값이상인 모든 차의 제조사와 모델명  ##
#########################################################




# 1)
library(MASS)
?Cars93
str(Cars93)
Cars93$MPG.city

MPG30Cars93 <- subset(Cars93, select=Model,subset=(MPG.city>=30))
MPG30Cars93

# 2)
newCars93<- subset(Cars93, select=c(Manufacturer, Model, Type, subset=c(MPG.highway > median(MPG.highway))
 
newCars93

#열이름으로 열삭제
newCars93<-
newCars93







#데이터 프레임의 열이름 바꾸기

newCars93


#######    data editor 에서 데이터 변경    ##########
##  주의)실행 취소 기능이 없다.
##################################################

# 데이터 에디터를 불러들임
temp<-edit(lst1)     

# 에디터에서 변경한 내용을 다시 저장           
lst1<-temp       

# 에디터에서 변경한 내용을 덮어씀              
fix(lst1)                      

lst1



######### NA 값이 있는 행을 삭제하기   ###########


#벡터 생성

x<-c(0.1,-0.5,1.5,1.6,-0.9,NA)
y<-c(0.5,-1.5,NA,NA,1.5,2.5)

#벡터를 데이터프레임으로 변환
NA_example<-data.frame(x,y)
NA_example     
cumsum(NA_example) # 누적합을 구하는 함수


# NA 값을 가지고 있는 행을 삭제
NA_clean<-na.omit(NA_example) # omit NA존재 행 삭제
NA_clean            
cumsum(NA_clean)


# 두개의 데이터 프레임을 합칠때

x<-c(1.5,1.3,1.5,1.4,1.8,1.8)
y<-c(2.7,2.8,3.5,3.2,3.4,3.9)
z<-c(5.7,5.8,6.9,5.8,5.1,5.6)
b_dfm1<-data.frame(x,y)
b_dfm2<-as.data.frame(z)
cb_dfm<-cbind(b_dfm1,b_dfm2)
cb_dfm

x<-c(1.5,1.3,1.5)
y<-c(2.7,2.8,3.5)
z<-c(5.7,5.8,6.9)
b_dfm3<-data.frame(x,y,z)
rb_dfm<-rbind(b_dfm3, b_dfm3)
rb_dfm



#recycling rule 주의

x<-c(1.5,1.3,1.5,1.4,1.8,1.8)
y<-c(2.7,2.8,3.5,3.2,3.4,3.9)
z<-c(5.7,5.8,6.9,9.9,1.1)
b_dfm1<-data.frame(x,y)
b_dfm2<-as.data.frame(z)
cb_dfm<-cbind(b_dfm1,b_dfm2)
cb_dfm


x<-c(1.5,1.3,1.5)
y<-c(2.7,2.8,3.5)
z<-c(5.7,5.8,6.9)
a<-c(8.9,7.9,5.9)
b_dfm3<-data.frame(x,y,z)
b_dfm4<-data.frame(x,y,a)
rb_dfm<-rbind(b_dfm3, b_dfm4)
rb_dfm

########  두개의 데이타 프레임을 동일한 변수를 중심으로 합치기  #######

T_name<-c("T1","T2","T3","T4","T5","T6")
x<-c(1.5,1.3,1.5,1.4,1.8,1.8)
y<-c(2.7,2.8,3.5,3.2,3.4,3.9)

T_na<-c("T1","T3","T5")
z<-c(5.7,5.8,6.9)

b_dfm1<-data.frame(T_name, x, y)
b_dfm2<-data.frame(T_name=T_na, z)
b_dfm1
b_dfm2

mg_dfm<-merge(b_dfm1, b_dfm2, by="T_name")
mg_dfm

mg_dfm<-merge(b_dfm1, b_dfm2, by="T_name", all=T)
mg_dfm
?merge

### 2019-09-29 12:31

#
#
#한번더 연습해 보자
#
#

a<-read.csv("frame.csv", header=T) 
b<-read.csv("frame2.csv", header=T)  
merg1<-as.data.frame(a)
merg2<-as.data.frame(b)

merg1
merg2

#empno 변수를 중심으로 데이터 프레임 병합

merg <-  merge(merg1, merg2, by="empno")
merg

#enmae.y 가 중복되어 삭제

merg<- subset(merg,select=-ename.y)
merg


#
#데이터 프레임 내용을 더 쉽게 접근하기
#
#

zz<-
zz

attach(rb_dfm)
zzz<-x+y-z
zzz
detach()


############# 5. 데이터 변형
# 자료형 변환하기
#
#as.charater()
#as.complex()
#as.numeric() 또는 as.double()
#as.integer()
#as.logical()




# 데이터 구조 변환하기
#
#as.data.frame()
#as.list()
#as.matrix()
#as.vector()





#########  데이터 변형   ############
####################################

#   apply 함수, (apply, lapply, sapply, tapply, mapply)###
#   by함수, split 함수                                  ###
#   위의 함수들을 통해 단번에 데이터를 변형하고 처리할 수 있다.   ###
#########################################################


# 요인을 통해 집단 정의  ###
v<-c(24,23,52,46,75,25)
w<-c(87,86,92,84,77,68)
f<-factor(c("A","A","B","B","C","A"))
dfm<-data.frame(value=v,group=f)
dfm

###  벡터를 여러 집단으로 분할하기  ##
#group<-split(v,f)                           #벡터를 요인에 따라 분할
#group <-unstack(data.frame(v,f))            #벡터가 동일한 길이인 경우 리스트를 데이터 프레임으로 변환해줌

group<-split(v,f)
group

group<-split(w,f)
group

group<-unstack(data.frame(v,f))
group

group<-unstack(data.frame(v,w))
group


library(MASS)   
head(Cars93)                    
                                             # Origin={USA,non-USA}, MPG.city는 도시에서의 연비


g<-split(Cars93$MPG.city, Cars93$Origin)
g


                                             #MPG 평균 계산
mean(g[[1]])
mean(g[["USA"]])
mean(g[[2]])
mean(g[["non-USA"]])



### 리스트의 각 원소에 함수 적용   #####

#list<-lapply(l,func) 
#vector<-sapply(l,func) 


s1<-c(91,87,95,96,89,87,86,85,84,86,88,92,91,93,92,92,91,93,94,94,95,96,96,96,99,95,98,97,92,86,84,89,87,86,89,85,84)
s2<-c(89,86,85,92,93,91,90,89,81,84,85,89,92,95,96,91,93,92,90,90,92,91,93,92,90,92,92,93,94,99,95,96,94)
s3<-c(89,86,78,89,84,95,87,92,90,90,91,93,93,92,93,94,95,95,96,98,100,85,79,82,89,86,95,89,92,91,90,90,93,90,85,86,84,90)
s4<-c(89,79,85,86,86,85,84,82,82,91,92,100,89,91,92,90,93,91,90,85,86,84,87,89,90,90,89,86,89,85,89,87,84,80,79,90,82)

length(s1)
length(s2)
length(s3)
length(s4)

scores<-list(Korean=s1, English=s2, Math=s3, Chinese=s4)
scores

# lapply 결과를 리스트 형태로 반환
# sapply 결과를 벡터 또는 행렬 형태롤 반환

lapply(scores,length) 
sapply(scores,length)
sapply(scores,mean)
sapply(scores,sd)
sapply(scores,range)

ttest<-lapply(scores,t.test)
ttest

sapply(ttest,function(t) t$conf.int)

# conf.int: 신뢰구간? 

### 2019-09-30 10:31
#####  모든 행에 함수 적용하기   #####

##  results<-apply(met, 1, func)


m1<-c(82.5,88.2,89.2,87.5,89.9,78.3,79.8,80.9,81.9,83.5,85.6,87.2,88.2,89.5,91.5,78.9,79.2,81.5,83.2,82.5)
dim(m1)<-c(4,5)
colnames(m1) <- c("tr1","tr2","tr3","tr4","tr5")
rownames(m1) <- c("Tom","Yoon","Moon","Song")
m1

#apply함수는 행렬의 처리를 위해 만들어졌고 1-행,2-열을 func으로 처리

apply(m1, 1, mean)
apply(m1, 2, mean)

#lapply는 리스트 형태에서 적용할 수 있으므로 행렬의 모든 원소를 리스트로 인식함
lapply(m1,mean)
  

#sapply는 모든 행렬의 원소를 벡터로 인식하여 반환함
sapply(m1, mean)
 


t<-read.csv("test.csv", header=T)
test<-data.frame(t)
test

#데이터 프레임에서 apply를 적용하려면 데이터가 모두 숫자나 문자로 동질적인 경우만 적용가능

apply(test,1,mean)
apply(test,2,mean)

#데이터 프레임의 각 열들의 클레스를 확인할 때 활용 가능

sapply(test,class) 


#데이터 프레임에서 열을 기준으로만 func을 적용할 때 사용가능, lapply는 리스트로 값을 반환

lapply(test,mean)

#데이터 프레임에서 열을 기준으로만 func을 적용할 때 사용가능, sapply는 벡터로 값을 반환

sapply(test,mean) 



###### 데이터 집단에 함수 적용하기    ###############
###############################################
###############################################

# tapply(x,f,func)               # x는 벡터, f는 집단 분류 요인, func는 함수

Cars93
attach(Cars93) # Cars93$Weight 따위 필요없이 Weight 사용가능
str(Cars93)
sum(Weight)
mean(Weight)

Origin
                                     
tapply(Weight,Origin,sum)# Cars93 데이터 프레임에서 무게를 생산지 구분별로 합계
tapply(Weight,Origin,mean)# Cars93 데이터 프레임에서 무게를 생산지 구분별로 평균
tapply(Weight,Origin,length)# Cars93 데이터 프레임에서 무게의 객수를 생산지 구분별로 카운트

###### 행 집단에 함수 적용하기    ###############
###############################################
###############################################
library(MASS)
by(Cars93, Origin, summary)

# Cars93 데이터 프레임에서 생산지구분별로 요약

head(Cars93)
attach(Cars93)
model<-by(Cars93, Origin, function(df) lm(Price~Weight+EngineSize,data=df))
model
summary(model[[2]])

lapply(model, confint)

# 함수를 생성


2019-09-30 10:56
#문자열다루기

#문자열 길이 알아내기

nchar("Tom")
nchar("My name is Tom")

n<-c("my", "name", "is", "Tom")
length(n)

#문자열 연결하기

paste("My","name","is","Tom")
paste("The pi is approximatly", pi)
name<-c("Tom", "Moe", "Larry")
paste(name, "loves me.")
paste(name,"loves me", collapse=", and ")

#하위문자열 추출하기
substr("Statistics",3,4)
substr("Statistics",1,3) # substr(str, start, stop)

#구분자로 문자열 분할하기
path<-"/home/dataedu/basic/R"
pa <- strsplit(path,"/")
str(pa)
pa[[1]][2]


#하위 문자열 대체하기
s<-"Curly is the smart one. Curly is funny, too."

sub("Curly", "Tom", s) # first one
gsub("Curly", "Tom", s) # globaly

#문자열의 모든 쌍별 조합 만들기
location<-c("Seoul","Pusan","Incheon")
treatment<-c("T1","T2","T3")
outer(location, treatment, paste, sep="-")

#현재 날짜 알아내기

Sys.Date()

#문자열을 날짜로 변환하기

as.Date(Sys.Date())
as.Date("10/06/2019", format="%m/%d/%Y")


#날짜를 문자열로 변환하기

as.character(Sys.Date())
format(Sys.Date(), format="%m/%d/%Y")

#날짜 일부 추출하기
d<-as.Date(Sys.Date())
p<-as.POSIXlt(d)
p$mday
p$year
p$year+1900

#날짜로 수열 생성하기
start<-as.Date("2019-09-28")
end<-as.Date("2019-10-07")
countdown<-seq(from=start, to=end, by=1)
countdown
length(countdown)

seq(from=start, by="month", length.out=12)
seq(from=start, by="3 months", length.out=5)
seq(from=start, by="year", length.out=5)


