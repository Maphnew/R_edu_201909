###-----------------------------------------------------------------------------
### 1.descriptive statistics
###-----------------------------------------------------------------------------

#- iris 데이터셋 불러오기
data(iris)
head(iris)      #상위 6개 데이터 확인
summary(iris)   #iris 데이터 요약하기

#- iris 데이터셋의 Sepal.Length열의 기술통계 확인하기

Se_L<-iris$Sepal.Length

mean(Se_L)
median(Se_L)
sd(Se_L)
var(Se_L)
quantile(Se_L,1/4)
quantile(Se_L,3/4)
max(Se_L)
min(Se_L)

#요약
install.packages("Hmisc")
library(Hmisc)
summary(Species ~. ,data=iris, method="reverse")
# 수치형 자료는 1사분위수/중앙값/3사분위수를 나타냄
summary(cyl ~. ,data=mtcars, method="reverse")

install.packages("MASS")
library(MASS)
data(Animals, package="MASS")
Animals




An_B <- Animals$body










An_b <- Animals$brain












library(MASS)

#왜도와 첨도
data(Cars93)
str(Cars93)
#- Price 변수에 대해 확인

install.packages("fBasics")
library(fBasics)

skewness(Cars93$Price)
#- 오른쪽으로 꼬리가 긴 형태를 띠고 있음.
plot(density(Cars93$Price))

with(Cars93, tapply(Price, Type, skewness))
#- 차량의 Type 별 Price의 왜도를 확인

kurtosis(Cars93$Price)
#- 양수로 나타나 정규분포보다 뾰족한 형태를 취하고 있다고 할 수 있음

with(Cars93, tapply(Price, Type, kurtosis))
#- 차량의 Type 별 Price의 첨도를 확인

#줄기-잎 그림 그리기
stem(Cars93$MPG.highway)
plot(density(Cars93$MPG.highway))
#분할표 그리기

#  xtabs(
#  formula,  # L1 ~ R1 + R2 + R3 형태의 포뮬러다. R1, R2, R3 등은 분할표의 분류를
             # 나타내는 변수들이다. "~"의 왼쪽에 빈도를 나타내는 변수를 적을 수 있다.
#  data,     # 포뮬러를 적용할 데이터
#)
xtabs(~ Type + Cylinders, data=Cars93)
xtabs(Cars93$Origin=="USA" ~ Type + Cylinders, data=Cars93)
xtabs(Cars93$Origin=="non-USA"~ Type + Cylinders, data=Cars93)

# Origin 변수가 USA 일때와 non-USA일때를 구분하여 분할표를 그림

