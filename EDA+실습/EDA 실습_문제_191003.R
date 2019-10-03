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


#-- 


#-- 


# Q-2. survived와 age, fare 각각에 대한 boxplot을 그리고 해설을 적으시오.

###생존유무와 age, fare의 boxplot


#--






#--


# Q-3. pclass에 대한 barplot을 그리고 해설을 적으시오.

###막대그래프

#--


# Q-4. pclass와 sex에 대한 누적 barplot을 그리고 해설을 적으시오.

#좌석 등급과 성별에 대한 누적막대그래프








#--

# Q-5. age1과 survived에 대한 누적 barplot을 그리고 해설을 적으시오.
#연령대와 생존에 대한 누적막대그래프







#--
#--


# Q-6. survived와 pclass, sex에 대한 mosaicplot을 그리고 해설을 적으시오.
# hint. mosicplot() 함수 이용, survived~pclass+sex

##생존에 대한 좌석 등급, 성별의 mosaicplot

#--mosaic()
#--

# Q-7. survive에 대한 pclass, sex의 분할표를 그리시오.

#생존에 대한 좌석 등급, 성별의 분할표



# Q-8. pclass, sex에 대한 생존율, 사망율 분할표를 그리시오.
#좌석, 성별에 대한 생존율, 사망율 분할표




#--
