
##### 1. 연습문제
# R의 내장 데이터 PlantGrowth 는 서로 다른 처리를 가한 식물들의 건조 중량을
# 조사한 데이터이다. 서로 다른 처리법을 의미하는 group 변수의 각 처리방법에 대해
# 식물의 중량을 나타내는 weghit 변수값에는 차이가 있는지를 통계적으로 검정해보자.
# 또한 처리방법별 식물의 중량에 차이가 있다면,
# 어떠한 처리방법에 대해서 차이가 존재하는지도 함께 검정하여라.
# (정규성과 등분산성이 만족한다는 가정하에 분석을 실시하며, 유의수준 0.05하에서 검정을 실시) 


##### Solution

# 데이터 불러오기
data(PlantGrowth)
str(PlantGrowth)

# 가설 설정
# 귀무가설 : 처리방법별 식물의 중량에 차이가 없다.
# 대립가설 : 처리방법별 식물의 중량에 차이가 있다.

# 정규성검정
shapiro.test(PlantGrowth$weight)

# 등분산성 검정
bartlett.test(weight~group, data=PlantGrowth)

# 분석 수행
result<-aov(PlantGrowth$weight~group, data=PlantGrowth) #분산분석 결과를 result 변수에 저장
summary(result)                             #분산분석표 확인



# 분산분석표를 통해 확인한 결과, 
# 

# 분석 결과, 
# SSA의 자유도는 2
# SST의 자유도는 27
# 


# 사후검정 수행 (R의 TukeyHSD, scheffe.test함수를 이용)

TukeyHSD(aov(weight~group, data=PlantGrowth))

#  
# 
install.packages("agricolae")
library(agricolae)
comparison <- scheffe.test(result, # ANOVA model 
                           "group", # vector treatment applied to each experimental unit
                           alpha = 0.05, # significant level
                           console=TRUE, # print out
)