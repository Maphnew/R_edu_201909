### 5. 결측치 : 결측값은 보통 NA, 99999999, ' ' 등으로 표현됨
## 가. 결측치 인식 방법

# 1) is.na() : 데이터에서 결측치가 존재하면 TRUE 값을 반환

#ex) airquality 데이터에서 NA가 있는 행을 is.na를 통해 확인하기

head(airquality)	#상위 6개만 봐도 5행, 6행에 NA가 존재함을 확인

                             	#apply 함수를 통해 열별 결측치의 개수를 확인(TRUE는 1이므로)


# 2) complete.cases() : 그 행에 결측치가 존재하면 FALSE값을 반환

#ex) airquality 데이터에서 NA가 있는 행을 complete.cases를 통해 확인하기

                         			#벡터형태로 FALSE값을 출력

                                     	#TRUE값을 출력하기에 !를 붙이면 결측치가 존재하는 FALSE값이 TRUE가 되어 출력

## 나. 결측치 처리

# 1) 변수 대체값 넣기(data[]<-대체값)
#ex) airquality 데이터에서 NA가 있는 행에 대체값 넣기

tail(airquality)				#150번째 행의 Ozone 농도를 발견하여 대체값을 넣어야 됨
                               	#airquality 데이터의 150번째 행에서 Ozone 변수값에 28을 대체값으로 대입

tail(airquality)

# 2) na.rm : na.rm은 평균 등 수치형 데이터로 값을 구할 때, 결측값은 제거하고 구하는지 여부를 물음
#		 인자형태로 사용되며, 가능한 일부 함수에서만 사용 가능하다는 점을 주의해야 함

#ex) airquality 데이터의 Ozone열의 평균값 구하기
                              	#Ozone의 데이터에 NA가 있어 평균을 구하면 NA가 나타남
                              	#Ozone의 데이터에서 NA 값을 제외한 값들의 평균 값을 구함

# 3) na.omit : na.omit은 결측값이 있는 행을 제외한 결과를 보여줌.(하나의 행 중 하나의 NA만 있어도 제외)

#ex) airquality 데이터에서 NA 행 제외하기(na.omit 사용한 것과 안한것 비교)

a<-airquality
nrow(a)				#airquality의 행은 총 153개

apply(is.na(a),2,sum)	#airqulaity 데이터에서 NA는 Ozone과 Solar.R에 있음을 알 수 있다.

                                    	#Ozone과 Solar.R 중 NA가 하나라도 있으면 1, 아니면 0

      		#Ozone과 Solar.R 중 하나라도 NA가 있는 행은 42개

            	#na가 1이 아닌 행만 선택하여 aa에 저장
nrow(aa)		#111개의 행이 있음을 확인

                  	#위와달리 na.omit를 사용하여 행을 확인
nrow(b)			#111개의 행이 있음을 확인
b

# 4) na.approx : na.approx는 NA값을 앞의 값과 뒤의 값의 평균으로 대체 해줌. 하지만, 시계열데이터만 해당되며 데이터 사이의 결측값만 채워줌
#    na.locf   : na.locf는 last observed carried forward 방식으로 마지막의 NA값들을 마지막 관측된 값으로 채워줌
#		     여기서 fromLast옵션은 관측된 값을 앞으로도 땡겨서 채울 수 있음
install.packages("zoo")
library(zoo)

aa <- c(NA, NA, 1,2, NA,6, NA ,NA, NA)
bb <-  
bb

cc <-  
cc

dd <-  
dd

# 5) knnimputation : knnImputation은 각각의 결측치에 대해 knn방식을 써서 근접 이웃의 가중 평균으로 채워넣음
# knnImputation(data, 
#		    k = 10,		#k는 몇개의 근접갯수로 결측치를 채워 넣을지 정하는 것, default는 10개
#		    scale = T)	#scale는 knn을 하기 전, 데이터를 정규화 할지 여부를 물음
install.packages("DMwR")
library(DMwR)

#airquality 데이터에서 Ozone과 Solar.R 변수의 NA 값을 knnImputation을 통해 대치

                                    		#airquality데이터에서 NA가 있는 행을 보여줌

                               			#NA가 있는 행의 번호를 출력

 

#knnImputation을 통해 결측값 대치

# 6) centralimputation : centralimputation은 결측치를 수치형 변수는 중앙값, 범주형 변수는 최빈값으로 대치

#airquality 데이터에서 Ozone과 Solar.R 변수의 NA 값을 centralImputation을 통해 대치
summary(airquality)			#Ozone과 Solar.R 변수의 median값을 확인

                              		#airquality데이터에서 NA가 있는 행을 보여줌


#중앙값으로 대치되어있음을 확인

### 6. 이상치 : 이상치는 의도하지 않게 잘못 입력된 데이터 또는 의도하지 않은 현상이지만 분석에 포함 또는 제거해되는 데이터 등을 말함
###		   이상치를 꼭 제거해야하는 것은 아니기 때문에 분석의 목적이나 종류에 따라 적절히 판단이 필요
###		   이상치는 절단하여 제거(10%절단, 상하위 5%에 해당하는 데이터)또는 값을 조정하는 방법이 있음

## 가. 인식

# 1) boxplot : min, max, 1-Q, median, 3Q 값을 그림으로 표현
#		   상자그림의 outer fence 밖에 있는 값을 확인하여 제거하거나 할 수 있음.

#ex) 임의 값 사이에 크거나 작은 값을 넣어 이상치 확인

set.seed(1010)
x<-rnorm(100)
boxplot(x)

                  		#임의 값을 넣음
                  		#boxplot을 그렸을 때, 점으로 나타나 이상치가 나타남
           				#boxplot의 점을 보여줌

# 2) 사분위수 : 상자그림의 박스와 범위는 사분위수로 나타나므로 사분위수를 이용해 이상치를 인식할 수 있음
#		  fivenum(min, Q1, median, Q3 , max 값을 출력)과 IQR 함수를 활용하여 확인
#		  Q1-1.5*IQR<data<Q3+1.5*IQR를 벗어난 데이터를 이상치라고 정의, IQR= Q3-Q1

b<-fivenum(a)	#x 데이터를 fivenum함수를 활용하여 나타나는 결과는 min, max, 1-Q, median, 3Q 순서

                                    	#which를 사용하여 해당 수식에 속하는 데이터의 위치를 파악
                                    	#-10, 19, 28, 30의 위치가 나타남, 해당 숫자를 이상치로 판정하여 처리해야 함

# 3) 패키지 : 주로 outliers 패키지를 활용하여 이상치를 찾음, outlier 함수는 가장 크거나 작은 값을 이상치로 판정
# outlier(data,		
#	    opposite=T,	#opposite=T이면 가장 작은 값을 이상치로 찾음
#	    logical=T)	#logical=T이면 각각의 값들이 이상치인지 아닌지를 TRUE, FALSE로 나타냄

# rm.outlier(x, 
#		 fill = FALSE, 		#fill=T이면 중앙값이나 평균으로 제거된 값을 대체함
#		 median = FALSE, 		#median=T이면 중앙값을 대체값으로 사용함
#		 opposite = FALSE)	#opposite=T이면 가장 작은 값을 이상치로 찾음

install.packages("outliers")
library(outliers)

         			#이상치로 판정된 값을 나타냄
                   	#가장 작은 값을 이상치로 판정
                  	#해당 값의 이상치여부를 TRUE,FALSE로 나타냄

                                                            	#가장 큰값을 이상치로 판명해 삭제됨
                                                             	#삭제된 이상치에 대체값으로 평균값이 들어감
