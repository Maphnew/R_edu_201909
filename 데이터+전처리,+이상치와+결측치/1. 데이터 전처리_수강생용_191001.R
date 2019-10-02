####데이터 전처리

### 1. 제어문
## 가. 조건문(if/else, ifelse())

# 1)if/else
#조건식을 기준으로 조건이 참일 때(TRUE)와 거짓일 때(FALSE)의 처리 방식을 다르게 하려는 경우에는 조건문을 사용

# if(조건) {                     #괄호 안의 조건이 참, 거짓일 때 각각 { }안의 코드를 실행   
#   조건이 참일 때 수행할 코드
# } else if (조건) {             #else if와 else는 필요에 따라 지정하거나 생략 가능
#   조건이 참일 때 수행할 코드
# } else {
#   모든 조건이 거짓일 때 수행할 코드
# }

#ex) 정수를 입력받아 짝수인지 홀수인지 판단하는 if문 작성
x<-9
if(x%%2 ==0 ){
	print(paste(x,"는 짝수.")) # x/2의 나머지가 0이면 참
}else if(x%%2==1){			# 참일 때 수행할 코드
	print(paste(x,"는 홀수."))
}else{					# 위의 조건 중 어느것도 만족하지 않을 때 수행
	print("정수를 입력해주세요!") 
}                                  

# 2) ifelse
#ifelse(조건, a, b) #조건이 참이면 a를 실행하고, 거짓이면 b를 실행, 중첩사용 가능

#ex) 정수를 입력받아 짝수인지 홀수인지 판단하는 ifelse문을 작성
x<-21.3
ifelse(x%%2==0, "짝수", ifelse(x%%2==1, "홀수", "정수가 아닙니다."))




## 나. 반복문(for, while, repeat)

# 1) for
# for문은 주로 반복 횟수가 정해진 경우에 사용

# for(변수 in 데이터){    #데이터에 들어 있는 값을 변수에 모두 할당할 때까지 {}안의 코드를 반복해서 수행
#    반복할 코드          #데이터 자리에는 수치형 벡터 혹은 수치형 벡터를 저장한 변수가 들어갈 수 있음
# }                     #for문 안에 또 다른 for문을 중첩하여 사용이 가능

#ex) for문을 이용하여 아래와 같이 출력하기
# [1] "The year is 2016"
# [1] "The year is 2017"
# [1] "The year is 2018"
# [1] "The year is 2019"


for(year in c(2016:2019)){
	print(paste("The year is",year))
}


# 2) while
# while문은 반복 횟수의 지정 없이 주어진 조건이 참이라면 계속해서 반복을 수행하는 반복문

# 변수<-초기값

# while(조건){                 # 괄호 안의 조건이 참일 때 { }안의 코드가 수행되고, 조건이 거짓일 때 while문이 종료
#    조건이 참일 때 수행할 코드   # while문을 정의하기 전에 먼저 조건에 사용될 변수의 초기값을 지정
# }

#ex) 위의 for문을 사용하여 수행한 예제를 while문을 이용하여 구현
year<-2016
while(year<=2019){
  print(paste("The year is", year))
  year <- year+1
}



# 3) repeat
# 다른 프로그래밍 언어의 do-while문과 비슷한 역할을 함

#repeat {                       # { }안의 코드를 반복해서 수행
#  반복할 코드                   # 끝없이 실행되기 때문에 주로 if문, break문과 함께 사용
#}

# break : 반복문 종료
#ex) 1~10 까지의 숫자 중 짝수만 출력하기


            # i가 10이상이면 반복문 종료

# next : next 이후의 명령은 수행하지 않고, 반복문을 계속 수행
#ex) 1~10 까지의 숫자 중 홀수만 출력하기


### 2. 변수 생성
## 가. 파생변수 생성
# 파생 변수 : 사용자가 특정 의미를 부여하여 만든 변수
#           고객 세분화, 주 구매 매장 파악, 특정 지수개발 등에 활용
#           다양한 방법으로 변수를 만드는 방법을 알아보자.

# 1) $ : data.frame에서의 변수추가
# $ 기호를 이용하면 데이터프레임에서 원하는 이름으로 새로운 변수를 즉시 생성할 수 있음

#ex) R의 내장 데이터 iris에 각 행의 고유번호를 의미하는 'ID' 라는 변수를 새로 생성하기
str(iris)
iris$ID<-1:150
iris$ID2<-1:151 #안됨.
head(iris)
                 # iris 데이터의 구조 확인 : 150개의 행과 5개의 변수를 가지고 있음
                 # 150개의 개체의 고유번호에 해당하는 'ID' 변수를 새로 생성
                 # head 함수로 iris 데이터의 상위 6개 행을 출력해 ID 변수가 추가된 것을 확인

# 2) [ ] : 대괄호를 활용한 변수추가
# [ ] 도 $기호와 마찬가지로 원하는 이름으로 새로운 변수를 즉시 생성할 수 있음
# 주의할 점은 새롭게 생성하고자 하는 변수의 이름을 “ ” 안에 기입해야 함

#ex) $, [ ]를 이용하여 생성한 iris의 ID값이 짝수이면 A, 홀수이면 B로 분류하는 ‘Group’ 이라는 변수를 새로 생성
iris["Group"]<-ifelse(iris$ID%%2==0,"A","B")
                                             # ifelse 함수를 이용하여 iD가 짝수이면 A, 홀수이면 B를 부여
head(iris)
                                             # iris 데이터의 상위 6개의 행을 출력 : Group 변수가 추가된 것을 확인할 수 있음

# 3) trnsform : transform함수를 이용하여 데이터프레임에 새로운 변수를 추가할 수 있으며, 문법은 아래와 같음
# transform(데이터프레임,        # 데이터프레임 : 변수를 추가하고자하는 데이터명
# var1=data1,        # var : 새로 생성할 변수의 이름
# var2=data2,...)    # data : 추가할 데이터 벡터

#ex) iris 데이터에서 Sepal.Length 변수와 Petal.Length 변수의 값을 더하여 ‘Sum.Length’ 라는 새로운 변수를 생성
transform(iris,Sum.Length=Sepal.Length+Petal.Length)
                                                         #sum.Length라는 변수 생성

# 4) within
# within(data,       
# var1=data1,        # var : 새로 생성할 변수의 이름
# var2=data2,...)    # data : 추가할 데이터 벡터

# ex) 학생의 id와 시험점수로 구성된 데이터프레임을 생성한 후 
#     시험점수를 수, 우, 미, 양, 가로 분류하는 ‘grade’ 라는 새로운 변수를 생성

student_id <- c("s1", "s2", "s3", "s4", "s5", "s6")     # 학생id가 담긴 벡터
score <- c(55, 90, 85, 71, 63, 99)                # 시험점수가 담긴 벡터
score_df <- data.frame(student_id, score)          # 데이터 프레임 생성
score_df

#학생의 점수(score변수)를 수, 우, 미, 양, 가로 분류하여 'grade' 라는 새로운 변수 생성

                                 # 새로운 변수 (생략하여도 상관 없음)
                                 # score가 60미만인 경우 grade에 “가” 입력
score_df <- within(score_df,{
  grade = character(0)
  grade[score < 60] = "가"
  grade[score >= 60 & score < 70] = "양"
  grade[score >= 70 & score < 80] = "미"
  grade[score >= 80 & score < 90] = "우"
  grade[score >= 90] = "수"
  grade = factor(grade, level=c("수","우","미","양","가"))
})

str(score_df)

  # grade변수를 "수", "우", "미", "양", "가"의 범주로 이루어진 팩터로 변환
score_df

### 3. 데이터 결합 및 요약
## 가. 결합
# 1) rbind : 벡터, 행렬, 데이터프레임을 행별로 합쳐서 새로운 행렬 또는 데이터프레임으로 생성 가능
#		 rbind를 사용할 때는 결합하고자 하는 데이터의 열 이름과 개수가 동일해야 한다는 점을 반드시 주의

#rbind(data1, data2, data3, ... , dataN)      # dataN : 행으로 결합하고자 하는 데이터

#ex) id와 last_name이라는 변수로 이루어진 두 개의 데이터프레임을 생성한 후 
#    두 데이터프레임을 행으로 결합하여 고객의 아이디와 성을 저장하고 있는 하나의 데이터프레임을 생성

# 행으로 묶을 데이터 생성 : rbind를 사용할 때에는 열의 이름과 개수가 동일해야 함
customer1 <- data.frame(id = c("c01","c02","c03","c04"),
                        last_name = c("Lee", "Kim", "Choi", "Park"))
customer1

customer2 <- data.frame(id = c("c05", "c06", "c07"), 
                        last_name = c("Lim" , "Bae", "Kim"))
customer2

                                       # rbind를 사용하여 두 데이터프레임을 결합
id_name <- rbind(customer1, customer2)
id_name

# 2) cbind : 벡터, 행렬, 데이터프레임을 열별로 합쳐서 새로운 행렬 또는 데이터프레임으로 생성 가능
#		 cbind를 사용할 때는 결합하고자 하는 데이터의 행 개수가 동일해야 한다는 점을 기억

#cbind(data1, data2, data3, ... , dataN)     # dataN : 열로 결합하고자 하는 데이터

#ex) 고객의 나이와 수입을 담고있는 데이터를 rbind 함수 예제에서 생성했던 고객의 id, 성을 담고있는 데이터와 결합
age_income <- data.frame(age = c(20, 25, 37, 40, 32, 45, 37), 
                         income = c(2500, 6400, 0, 7000, 3400, 3800, 5010))

                                               # cbind를 사용하여 두 데이터프레임을 결합
customer<-cbind(id_name, age_income)
customer
# 3) merge : 두 데이터프레임을 기준이 되는 특정 칼럼의 값이 같은 행끼리 묶는 함수, 데이터베이스의 join과 동일한 역할
# merge(x, y, by, by.x, by.y, all=FALSE, all.x, all.y)
# x,y : 병합할 데이터프레임
# by : 병합의 기준이 되는 칼럼
# by.x, by.y : 데이터프레임 x와 y에서 기준으로 사용할 칼럼의 이름이 서로 다른 경우 by.x와 by.y인자를 통해 지정
# all : 기준 칼럼에 대한 공통 값이 x 혹은 y 중 어느 한쪽에 없는 경우의 처리를 위한 인자
#       all=FALSE 이면 x, y 모두가 공통 값을 가지고 있는 행만 병합 
#       all=TRUE 이면 x 혹은 y 중 공통 값을 가지고 있지 않은 행에 대해서는 NA로 값을 채운 뒤 x와 y의 전체 행이 병합
# all.x, all.y : x 혹은 y 중 한쪽에 공통된 값이 없지만 해당 데이터의 모든 행이 결과 데이터에 포함되도록 하기 위해 사용
#                all.x=TRUE 이면 x데이터의 모든 행이 결과에 포함, all.y=TRUE 이면 y데이터의 모든 행이 결과에 포함

#ex) 고객의 아이디(id), 이름(name)으로 이루어진 데이터프레임(id_name)과 고객의 아이디(id), 번호(number)로 이루어진 
#    데이터프레임(id_number)을 생성한 뒤 다양한 방법으로 두 데이터를 병합하기

# 병합에 사용할 데이터프레임 생성
id_name <- data.frame(id = c("c01","c02","c03","c04","c05", "c06", "c07"), 
                      last_name = c("Lee", "Kim", "Choi", "Park", "Lim" , "Bae", "Kim"))

id_number <- data.frame(id = c("c03", "c04", "c05", "c06", "c07", "c08", "c09"), 
                        number = c(3, 1, 0, 7, 3, 4, 1))

# id_name, id_number 데이터프레임 확인
id_name
id_number

# ex 1) id 칼럼을 기준으로 공통된 값이 있는 경우에만 두 데이터(id_name, id_number)를 병합
#      (데이터베이스의 Inner Join에 해당)

merge(id_name, id_number, by= 'id')

# ex 2) id 칼럼을 기준으로 공통된 값의 유무에 관계없이 모든 행을 병합
#      (데이터베이스의 Outer Join에 해당)

merge(id_name, id_number, by= 'id', all=T)

# ex 3) id 칼럼을 기준으로 두 데이터(id_name, id_number)를 병합하는데 
#       기준칼럼에 공통 값이 없는 경우에는 id_name 데이터를 기준으로 병합 (데이터베이스의 Left Outer Join에 해당)

merge(id_name, id_number, by= 'id', all.x=T)

# ex 4) id 칼럼을 기준으로 두 데이터(id_name, id_number)를 병합하는데 
#       기준칼럼에 공통 값이 없는 경우에는 id_number 데이터를 기준으로 병합 (데이터베이스의 Right Outer Join에 해당)

merge(id_name, id_number, by= 'id', all.y=T)


## 나. 요약
# 1) aggregate : 특정 칼럼을 기준으로 데이터를 그룹지어 집계함수를 적용
#aggregate(x, by, FUN)        #x : R 객체
#by : 데이터를 그룹화할 값들의 리스트
#FUN : 적용할 함수
#aggregate(formula, data, FUN)	#formula : ‘집계함수를 적용시킬 열 ~ 그룹화할 기준이 되는 열’의 형태를 입력
#data : 연산을 수행할 데이터프레임

#ex 1) iris 데이터에서 종별 Sepal.Width의 평균구하기
aggregate(Sepal.Width~Species, iris, mean)

#ex 2) iris 데이터에서 종별 Sepal.Width, Petal.Width 의 평균구하기
aggregate(cbind(Sepal.Width, Petal.Width)~Species, iris, mean) 

# 2) table : 범주형 변수에 대해서 각 범주별 도수를 알고자 도수분포표를 만들기 위해서는 table 함수를 이용
#		 또한, 이원분할표도 table 함수를 통해 간단하게 생성

#table(범주형변수)
#table(범주형변수1, 범주형변수2)   # 두 개의 범주형 변수를 인자로 넣으면 이원분할표가 생성

#ex 1) 내장데이터 Titanic에서 좌석등급을 의미하는 Class 변수에 대해서 도수분포표를 생성

#내장데이터 Titanic의 구조 확인(Titanic은 타이타닉호 탑승자들의 특성에 따른 생존여부를 기록해놓은 데이터)
str(Titanic)

# 분석을 위해 Titanic 데이터를 데이터프레임으로 변환한 뒤 다시 한번 구조를 확인
Titanic<-as.data.frame(Titanic)   # as.data.frame() : 객체를 데이터프레임으로 변환
str(Titanic)                      # 데이터 구조가 데이터프레임으로 변환되었음을 확인 가능

# table함수를 이용하여 범주형 변수 Class에 대한 도수분포표를 생성
table(Titanic$Class)
table(Titanic$Survived)

#ex 2) 내장데이터 Titanic에서 승객의 생존여부를 의미하는 Survived 변수와 Class 변수에 관계를 살펴보기 위한 표 생성
table(Titanic$Class, Titanic$Survived)

# 3) prop.table : 범주형 변수에 대해서 각 범주별 도수를 알고자 도수분포표를 만들기 위해서는 table 함수를 이용

#prop.table(table 객체)
#prop.table(table 객체, 1)    # 행별 상대도수 파악
#prop.table(table 객체, 2)    # 열별 상대도수 파악

#ex) Titanic 데이터에서 Age 변수는 해당 승객이 어른인지 아이인지의 여부를 나타냄
#    Age 변수에 따른 생존여부의 관계를 전체, 행별, 열별 상대도수(비율) 나타내기

# Age에 따른 Survived에 대한 비율을 파악
prop.table(table(Titanic$Age, Titanic$Survived))
prop.table(table(Titanic$Age, Titanic$Survived),1) # 행 별 비율 파악
prop.table(table(Titanic$Age, Titanic$Survived),2) # 열 별 비율 파악

# 4) subset : 전체 데이터에서 원하는 조건을 만족하는 부분만 추출할 때, 사용
#subset(data,			#data : 데이터를 추출할 벡터, 행렬, 데이터프레임
#	  조건,			#조건 : 사용자가 원하는 조건을 지정
#	  select=원하는 변수명)    #select : 데이터프레임의 경우 특정 열만을 뽑고 싶은 경우에 지정

#ex)iris 데이터에서 종(Species)이 setosa인것 중에 Sepal.Length의 값이 5.5이상인 값만 추출
subset(iris, 
      select=c(Species, Sepal.Length),
      subset=(Species=='setosa' & Sepal.Length >= 5.5))

subset(iris, 
       subset=(Species=='setosa' & Sepal.Length >= 5.5),
       select=c(Species, Sepal.Length))


## 다. apply 계열
# 1) apply : 주어진 함수를 데이터의 행 혹은 열 방향으로 적용하여 그 결과를 벡터, 배열, 리스트로 반환하는 함수

#apply(데이터,	#데이터 : 배열 또는 행렬 
#	 계산방향, 	#계산방향 : 1은 행 방향, 2는 열 방향
#	 적용함수) 	#적용함수 : 적용할 함수

#ex 1)4 x 3 행렬을 만든 후에 각 행별로 max 값 구하기
a <- matrix(1:12, nrow=4, ncol=3)        # matrix 생성 
apply(a, 1, max)                 # 1은 행 방향, 2는 열 방향을 의미
apply(a, 1, mean) 
#ex 2)iris 데이터의 1~4열에 대해서 평균을 구하기
apply(iris[,1:4], 2, mean)

# 2) lapply : 벡터, 리스트, 표현식, 데이터 프레임 등에 함수를 적용하고, 그 결과를 리스트로 반환
#		  데이터프레임에 대해서는 apply함수의 계산방향(MARGIN 인자값)을 2로 두었을 때와 동일하게 열별로 함수를 적용
#		  따라서 적용 데이터가 데이터프레임일 경우에 lapply의 결과 리스트 길이는 데이터프레임의 변수 개수와 같음
#		  적용 데이터가 벡터인 경우에는 결과 리스트 길이는 벡터 원소의 개수와 같음

#lapply(데이터, 		#데이터 : 벡터, 리스트, 표현식, 데이터프레임
#	  적용함수, ... )	#적용함수 : 적용할 함수


#ex 1) 숫자가 저장된 벡터를 입력받아 제곱을 한 뒤 리스트 형태로 반환
a <- c(1,2,3)                      # a는 1,2,3의 숫자가 저장된 벡터
lapply(a, FUN=function(x){x^2})                     # FUN인자의 값으로 제곱을 계산해주는 사용자 정의 함수를 사용

# 데이터구조 확인하기 : lapply 함수의 적용 결과 반환되는 데이터는 리스트임을 알 수 있음
class(lapply(a, FUN=function(x){x^2}) )                                           # class() : 객체의 물리적 자료형 반환 

# 만약 리스트로 반환된 결과를 벡터로 변환하고 싶다면 unlist함수를 이용하여 원하는 결과를 얻을 수 있음
b<-lapply(a, FUN=function(x){x^2})          # lapply를 적용한 결과를 변수 b에 저장
unlist(b)                                   # unlist함수를 이용하여 리스트 b를 벡터로 변환

#ex 2) iris 데이터프레임에서 Sepal.Length 값을 입력받아 반올림을 한 뒤 리스트 형태로 반환
c<-lapply(iris$Sepal.Length,FUN=function(x){round(x)})
unlist(c)                        #unlist함수를 이용하여 리스트 c를 벡터로 변환

# 3) sapply : 벡터, 리스트, 표현식, 데이터프레임 등에 함수를 적용하고, 그 결과를 벡터 혹은 행렬로 반환
#		  sapply는 연산결과를 벡터로 단순화해서 반환함을 의미
#		  변수마다 함수를 적용한 결과 값의 길이가 1이면 벡터로 반환
#		  변수마다 함수 적용 결과 값의 길이가 1보다 크면 행렬로 반환
#		  함수를 적용한 결과 값의 길이가 변수마다 다르면 단순화할 수 없으므로 리스트로 반환

#sapply(데이터, 			#데이터 : 벡터, 리스트, 표현식, 데이터프레임
#	  적용함수, 			#적용함수 : 적용할 함수
#	  simplify=TRUE, ... )  #단순화에 대한 여부를 지정하기 위한 인자로 FALSE로 값을 설정하면 리스트가 반환됨

#ex 1)iris 데이터에서 각 컬럼별 데이터 타입 알아보기
sapply(iris, class)
sapply(iris, class, simplify = FALSE)

# 데이터구조 확인 : 변수마다 함수를 적용한 결과 값이 하나씩 존재하므로 문자형 벡터로 반환
class(sapply(iris,summary))                          	# "character"는 문자를 저장한 벡터를 의미

#ex 2)iris 데이터에서 각 컬럼에 summary함수를 적용
sapply(iris, summary)

# 데이터구조 확인 : 변수마다 함수를 적용한 결과 값의 길이가 다르므로 리스트로 반환
 

# 4) vapply : sapply와 유사하나 출력결과의 형태를 사용자가 직접 지정이 가능
#vapply(데이터, 			#데이터 : 벡터, 리스트, 표현식, 데이터프레임
#	  적용함수, 			#적용함수 : 적용할 함수
#	  출력 템플릿, ... ) 	#출력 템플릿 : 함수실행의 결과로 출력되는 값의 행태를 지정

#ex)1~100까지의 숫자가 저장된 리스트에 fivenum함수를 적용
# fivenum() : 최소값, 1사분위수, 중위수, 3사분위수, 최대값을 차례로 출력

# 1~100까지의 숫자가 저장된 벡터 생성
test <- c(1:100)

# 1) fivenum 함수를 적용
fivenum(test)

# 2) vapply를 이용하여 fivenum 함수를 적용하는데 출력되는 결과의 형식(Template)을 원하는대로 지정
test <- list(test) #벡터를 리스트 형태로 변환
test

#출력되는 결과의 양식(Template)을 Min, Q1, Median, Q3, Max 로 지정
vapply(test, fivenum, c("Min"=0, "Q1"=0, "Median"=0, "Q3"=0, "Max"=0))

# 5) mapply : sapply의 확장 버전으로 여러 개의 리스트 또는 벡터로 주어진 인자를 받아 함수에 적용한 후 결과를 반환
#		  mapply의 m은 multivariate(다변수의)를 의미
#		  여러 개의 인자를 필요로 하는 함수를 여러 번 수행해야 할 경우에 다수의 요소를 한 번에 적용이 가능

#mapply(적용함수, 			#적용함수 : 적용할 함수
#	  인자1, 			#인자n : 함수에 넣을 인자에 해당하는 벡터 혹은 리스트
#	  인자2, ··· 인자n, ... ) 

#ex) 1을 4번, 2를 3번, 3을 3번, 4를 1번 반복하는 4개의 수열을 구하기(rep, mapply 함수 비교)
# 1) rep을 사용할 경우 총 4번의 R 코드를 실행해야 한다.
#   rep(x, times, ... )
#   x: 반복할 객체, times: 반복횟수
rep(1,4)
rep(2,3)
rep(3,2)
rep(4,1) 

# 2) mapply를 사용할 경우 1번의 R 코드 실행으로 동일한 결과를 얻을 수 있다. 
                                # rep함수의 x 인자값 : c(1:4), times 인자값 : c(4:1)

# 6) tapply : 데이터를 특정 기준에 따라 그룹으로 나눈 뒤 각 그룹별로 함수를 적용하여 그 결과를 반환
# tapply(데이터, 		#데이터 : 벡터 (데이터프레임의 특정 열)
# 기준, 		#기준 : 데이터를 그룹별로 나누기 위한 기준, 팩터형만 가능하며 비교구문을 이용하여 그룹을 나누는 것도 가능
# 적용함수, ... )	#적용함수 : 적용할 함수

#ex 1) Fruits 데이터에서 과일종류별 판매량의 평균을 구하기
# googleVis 패키지의 Fruits 데이터를 이용하기 위해 패키지 설치 및 로드
install.packages("googleVis")
library(googleVis)

# Fruits 데이터의 상위 6개의 행 확인
head(Fruits)

# tapply 함수를 이용하여 과일종류별 판매량의 평균 산출
tapply(Fruits$Sales, Fruits$Fruit, mean)

#ex 2) Fruits 데이터에서 Location이 West인 것과 아닌 것으로 그룹을 지정하여 Profit의 평균을 구하기
# INDEX인자에 비교구문을 사용하여 그룹을 지정
tapply(Fruits$Profit, Fruits$Location=="West", mean) 

### 4. 패키지를 활용한 데이터 전처리
## 가. dplyr: dplyr은 유연한 데이터 조작의 문법을 제공하며, plyr의 자기작으로 데이터 프레임을 집중적으로 다르는 툴
install.packages("dplyr")
library(dplyr)

# 1) select() : 데이터 프레임에서 변수(열)를 뽑아낼 때 사용
# select(data.frame, 변수(열이름))

#MASS 패키지의 select함수와 dplyr 패키지의 select함수가 겹치므로 아래의 방법으로 처리 후 실시
select <- dplyr::select

#ex 1) iris 데이터에서 Sepal.Length와 Sepal.Width 선택하기
select_1 <- select(iris, c(Sepal.Length,Sepal.Width)) #필요한 변수가 추출됨을 확인할 수 있음
head(select_1)

#ex 2)a번째부터 n번째 변수 선별
select_2 <- select(iris, 1:3)			#iris 데이터의 1~3열이 선택됨을 확인할 수 있음
head(select_2)

select_3 <- select(iris,Sepal.Length:Petal.Width)  #iris 데이터의 이름으로도 선택이 가능
head(select_3)

#ex 3)a번째부터 n번째 변수는 제외하고 선별
select_4 <- select(iris, -c(Petal.Length:Petal.Width)) 
head(select_4)

#ex 4)"xx_name"으로 시작하는 모든 변수 선별
select_5 <- select(iris, starts_with("Petal")) 
head(select_5)

#ex 5)"xx_name"으로 끝는 모든 변수 선별
select_6 <- select(iris, ends_with("Length")) 
head(select_6)

#ex 6)"xx_name"을 포함하는 모든 변수 선별
select_7 <- select(iris, contains(("S")))
head(select_7)

#ex 7)정규 표현과 일치하는 문자열이 포함된 모든 변수 선별
select_8 <- select(iris, matches(".L."))       		#변수의 문자열 중간에 l을 포함하는 변수 선별
head(select_8)


# 2) filter() : 데이터 프레임에서 행을 뽑아낼 때 사용
# filter(data.frame, 뽑아낼 조건)		#조건은 숫자, 문자에 따라 다르게 입력해야 함

#ex) iris 데이터에서 특정한 행 추출하기
filter(iris, Species=="setosa")            			#Species가 setosa인 행만 추출하기

filter(iris, Sepal.Length>7 & Sepal.Width>3)  	#AND조건으로 &나,(콤마)를 이용하여 추출이 가능

filter(iris, Petal.Length>6 | Petal.Width>2.5) #OR조건으로 | 를 이용하여 추출이 가능


# 3) arrange() : 데이터 프레임을 정렬할 때 사용
# arrange(dataframe, 기준열)		#기준열의 순서대로 정렬에 적용됨, desc는 내림차순정렬

#ex) iris 데이터 정렬하기
arrange(iris, Sepal.Length)
arrange(iris, Sepal.Length, desc(Petal.Length))

# 4) mutate() : 기존 열에 함수를 적용하여 새로운 열을 만듦
# mutate(dataframe, 새로운변수 = 기존변수 조합한 수식, ...)		#기존변수 + 신규변수 모두 남아 있음

#ex) iris 데이터에서 Sepal.Length와 Sepal.Width를 합쳐 Sepal.LW라는 새로운 열과 Petal.LW 만들기

mutate_1<-mutate(iris, Sepal.LW=Sepal.Length+Sepal.Width,
                      Petal.LW=Petal.Length+Petal.Width)

head(mutate_1)

                     						#mutateg함수를 통해 생성된 변수를 바로 활용해 신규 변수 생성가능 
mutate_2<-mutate(
    mutate_1, 
    Sepal=ifelse(
        Sepal.LW>=8.5, "Large", "Small"
        ),
    new=ifelse(
        Sepal=="Large",1,0
        )
    )

head(mutate_2)

# 5) transmute : 새로운 열을 생성
# transmute(dataframe, 새로운 변수 = 기존 변수 조합한 수식, ...) #신규변수만 생성

#ex)iris 데이터에서 Sepal.Length와 Sepal.Width를 합쳐 Sepal.LW라는 새로운 열과 Petal.LW 만들기


head(transmute_1)

# 6) group_by() : 특정 범주별로 그룹화된 결과를 얻기위해 사용. %>%(파이프 연산자)와 함께 사용
# %>%(파이프 연산자)란? 
# 여러 단계의 절차를 필요로해서 중간 결과를 지정 후 그 객체를 후속 절차에서 받아서 사용해야할 때 사용.

# 파이프 연산자 개념을 설명하기 위해서 Cars93이라는 데이터셋을 활용(Cars93은 자동차 93개의 관측치, 차량 정보 27개의 변수)
library(MASS)
str(Cars93)

# "Cars93 데이터프레임에서 차생산국가(Origin), 차종(Type), 실린더개수(Cylinders)별로 
# 차가격(Price)과 고속도로연비(MPG.highway)의 평균을 구하되, 
# 차가격 평균 10 초과 & 고속도로연비 25 초과하는 경우만 선별해서 제시하시오" 라는 문제를 파이프 연산자 없이 풀면 아래와 같다.

a1 <- group_by(Cars93, Origin, Type, Cylinders)
a2 <- select(a1, Price, MPG.highway)
a3 <- summarise(a2,
                Price_m = mean(Price, na.rm = TRUE),
                MPG.highway_m = mean(MPG.highway, na.rm = TRUE))
a4 <- filter(a3, Price_m > 10 | MPG.highway_m > 25)
a4

# 여러 단계의 각 단계에 대한 해석과 이해가 어렵기 때문에 dplyr의 파이프연산자를 하용해 아래와 같이 해결
Cars93 %>%  							# dataframe name
  group_by(Origin, Type, Cylinders) %>%  			# group_by()
  select(Price, MPG.highway) %>%  				# select() columns
  summarise(
    Price_m = mean(Price, na.rm = TRUE),
    MPG.highway_m = mean(MPG.highway, na.rm = TRUE)  	# summarise()
  ) %>%
  filter(Price_m > 10 | MPG.highway_m > 25)  		# filter() condition

# 파이프 연산자를 이용할 때, dataframe %>% group_by() %>% select() %>% summarise() %>% filter() 의 순서로 코드 작성

#ex) 각 과일 별 판매량의 평균을 구하기

#googleVis 패키지의 Fruits 데이터 이용
library(googleVis)
head(Fruits)
 
                   					#Fruits데이터 셋을 받아 Fruit별로 묶기 
                                          	#묶은 Fruit를 Sales를 기준으로 결측치를 제거한후에 평균을 구하기


## 나. reshape2: reshape는 데이터를 재구조화하기 위해 사용하는 패키지로 melt와 cast라는 2개의 핵심함수가 있음
# 1) melt : melt 함수는 데이터를 녹이는 함수로 일정한 기준에 따라 새로운 변수를 생성해 데이터를 변환
# melt(data,
#      id.vars = 기준열이름,
#      measure.vars = 변수화할 열 이름)

#ex) airquality 데이터의 id(Month, Day)를 기준으로 데이터를 변형
install.packages("reshape2")
library(reshape2)
install.packages("reshape")
library(reshape)

head(airquality)

melt_1 <- melt(airquality, id=c("Month", "Day"), na.rm=T)
#na.rm은 결측치가 존재하는 행을 삭제한 뒤, 함수에 적용하는 지의 여부를 물음
head(melt_1)

# 2) cast : cast 함수는 데이터를 원하는 형태로 계산 또는 변형 시켜주는 함수
# cast(data,		
#      formula,		#식의 형태에 따라 데이터를 변형
#      fun)			#해당 변수에 적용할 함수

#ex) melt 예제에서 melt_1데이터를 cast를 활용해 변형
cast(melt_1, Day~Month, subset=(variable=="Ozone"))
                                     	#세로축에는 Day, 가로축에는 Month, 마지막으로 variable별로 값을 넣어서 나타냄

                                     		#variable이 Ozone인 데이터만 뽑아내 나타냄

                                    	#달마다 각 variable 값의 평균값을 나타냄

                                  		#Month에 해당하는 모든 변수의 평균을 계산

                                          	#|를 활용하여 변수별로 계산



