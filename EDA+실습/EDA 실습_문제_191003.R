setwd("d:/R_edu_201909/EDA+실습")
getwd()

options(digits=3)

##데이터 불러오기
titanic<-read.csv("titanic3.csv")
str(titanic)
head(titanic)
View(titanic)

##데이터 전처리
titanic$pclass<-as.factor(titanic$pclass)
titanic$name<-as.character(titanic$name)
titanic$ticket<-as.character(titanic$ticket)
titanic$cabin<-as.character(titanic$cabin)
titanic$survived<-factor(titanic$survived,levels=c(0,1),labels=c("dead","survived"))

titanic<-within(titanic,
                {
                  age1=integer(0)
                  age1[age>=0 & age<10]=0
                  age1[age>=10 & age<20]=1
                  age1[age>=20 & age<30]=2
                  age1[age>=30 & age<40]=3
                  age1[age>=40 & age<50]=4
                  age1[age>=50 & age<60]=5
                  age1[age>=60 & age<70]=6
                  age1[age>=70 & age<80]=7
                  age1[age>=80 & age<90]=8
                })

titanic$age1<-factor(titanic$age1,levels=c(0,1,2,3,4,5,6,7,8),
                     labels=c("10세 미만","10대","20대","30대","40대","50대","60대","70대","80대"))

str(titanic)

#cabin, embarked의 "" -> NA 바꾸기
levels(titanic$embarked)
#C 캠브릿지, Q 퀸스타운, S 사우스햄프턴
levels(titanic$embarked)[1]<-NA
table(titanic$embarked,useNA="always") #useNA="always"는 NA 개수도 출력

titanic$cabin<-ifelse(titanic$cabin=="",NA,titanic$cabin)
str(titanic)

######################################################
############EDA(Exploratory Data Analysis)############
######################################################

attach(titanic)


# Q-1. age와 fare의 히스토그램을 그리고 해설을 적으시오.

###age와 fare의 히스토그램
hist(age,
     breaks=15,
     col="red",
     xlab="age",
     ylab="빈도수",
     main="Histogram AGE"
)

#-- 0 ~ 70대가 있고, 20대가 가장 많다.

hist(fare,
     breaks=20,
     col="blue",
     xlab="fare",
     ylab="빈도수",
     main="Histogram FARE"
)
#-- 요금은 0~50사이가 대부분이며 500이 넘는 요금까지 있다.


# Q-2. survived와 age, fare 각각에 대한 boxplot을 그리고 해설을 적으시오.

###생존유무와 age, fare의 boxplot
boxplot(
  age ~ survived,
  data=titanic,
  main="Age~Survived",
  xlab="Survived",
  ylab="Age"
)
#-- 20~40 사이의 사람들이 가장 많이 죽고 살아남았으며, 가장 나이가 많은 사람은 살아 남았다.
boxplot(
  fare ~ survived,
  data=titanic,
  main="fare~Survived",
  xlab="Survived",
  ylab="fare"
)

#-- 요금을 가장 많이 낸 사람은 살아 남았으며 요금을 적게 낸 사람들이 평균적으로 많이 죽었다.


# Q-3. pclass에 대한 barplot을 그리고 해설을 적으시오.

###막대그래프
plot(pclass, main="a")

str(pclass)

vpclass<-table(pclass)
str(vpclass)
class(vpclass)

barplot(vpclass,
        main="pclass Bar plot",
        xlab="pclass", 
        ylab="count",
        col=c("red","orange","yellow"),
        #ylim=c(0,5),
        legend=rownames(pclass))

#-- pclass 3-1-2 순서로 많음. 3은 약700명정도, 1은 300~400사이, 2는 200~300사이.


# Q-4. pclass와 sex에 대한 누적 barplot을 그리고 해설을 적으시오.

#좌석 등급과 성별에 대한 누적막대그래프

counts<-table(titanic$pclass, titanic$sex)
counts

barplot(counts,
        main="counts Bar plot",
        xlab="sex", 
        ylab="counts",
        col=c("red","orange","yellow"),
        beside = TRUE,
        legend=paste("pclass-",rownames(counts)))




#-- 남성, 여성 모두 pclass가 3인 사람이 많고, 여성의 경우 pclass1 과 pclass2를 합친 수 보다 pclass3이 많음.

# Q-5. age1과 survived에 대한 누적 barplot을 그리고 해설을 적으시오.
#연령대와 생존에 대한 누적막대그래프
n <- 10
mycolors <- rainbow(n) 

counts2<-table(titanic$age1, titanic$survived)
counts2

barplot(counts2,
        main="counts Bar plot",
        xlab="survived", 
        ylab="counts",
        col=mycolors,
        ylim=c(0,400),beside = TRUE,
        legend=paste(rownames(counts2)))

#-- 살아남은 사람보다 죽은 사람이 많다.
#-- 살거나 죽은 사람은 20대가 가장 많다.
#-- 10세 미만은 살아남은 사람이 죽은사람보다 많고, 10대는 죽은사람이 많다.


# Q-6. survived와 pclass, sex에 대한 mosaicplot을 그리고 해설을 적으시오.
# hint. mosicplot() 함수 이용, survived~pclass+sex

##생존에 대한 좌석 등급, 성별의 mosaicplot
# mosaicplot(~Cars93$Origin)
mosaicplot(survived~pclass+sex, color=TRUE, main="pclass and sex")
#--mosaic()
#-- 3 클래스 남자가 가장 많이 죽었고, 여자보다 남자가 더 많이 죽었다.
#-- 살아남은 사람은 여성이 남성보다 많다.

# Q-7. survive에 대한 pclass, sex의 분할표를 그리시오.

#생존에 대한 좌석 등급, 성별의 분할표
xtabs(survived=="survived"~ pclass + sex, data=titanic)
xtabs(survived=="dead"~ pclass + sex, data=titanic)


# Q-8. pclass, sex에 대한 생존율, 사망율 분할표를 그리시오.
#좌석, 성별에 대한 생존율, 사망율 분할표
# with(titanic, table(pclass, sex, survived))
xtabs(survived=="survived"~ pclass + sex, data=titanic)/xtabs(~pclass +sex, data=titanic)
xtabs(survived=="dead"~ pclass + sex, data=titanic)/xtabs(~pclass +sex, data=titanic)
#--
