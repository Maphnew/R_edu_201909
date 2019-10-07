setwd("d:/R_edu_201909")
getwd()

options(digits=15)

### EDA ###

busstopinfodevice<-read.csv("./제공용/csv파일/BITBUSSTOPINFODEVICE.csv")
head(busstopinfodevice)
str(busstopinfodevice)
attach(busstopinfodevice)

# SID_TYPE 분포
SID_TYPE<-as.factor(SID_TYPE)

plot(SID_TYPE, ylim=c(0,600))
# TYPE3의 정류장이 가장 많고, TYPE1이 가장 적음


############### 지도에 버스스탑 위치 뿌리기 ##########################

install.packages('devtools')
library(devtools)
install_github('dkahle/ggmap')
library("ggmap")

library(ggplot2)

MYBIBUSSTOP<-read.csv("./제공용/csv파일/MYBIBUSSTOP.csv")

API_key<-'AIzaSyBy5kz2WtDWtyO8cYJkE5STgT5n8SSmrVk'

register_google(key=API_key)

gu2 <- get_map("ulsan", zoom=10, maptype = "roadmap")
ggmap(gu2)


sum(is.na(MYBIBUSSTOP))
MYBIBUSSTOP<-na.omit(MYBIBUSSTOP)

MYBIBUSSTOP.map <- ggmap(gu2) + geom_point(data=MYBIBUSSTOP, aes(x=MYBIBUSSTOP$STOP_X2, y=MYBIBUSSTOP$STOP_Y2), size=0.5, alpha=0.6, color="green")  
MYBIBUSSTOP.map

################ 관할관청 별 버스스탑 위치 #################


plot(BITBUSSTOP$STOP_X, BITBUSSTOP$STOP_Y, xlab="X",ylab="Y", main= "map", col = BITBUSSTOP$STOP_ADMIN, pch = 16, cex=0.5)
legend("bottomright", legend=levels(BITBUSSTOP$STOP_ADMIN), col=c(1:3), pch=16)


################ 어디보자 ##################

MYBICARDHISTORY<-read.csv("./제공용/csv파일/MYBICARDHISTORY.csv")
MYBICARDHISTORY$STOP_ID
plot(MYBICARDHISTORY$STOP_ID)
MYBICARDHISTORY$STOP_NM

MYBIBUSSTOP$STOP_ID

csid <- c(MYBICARDHISTORY$STOP_ID)
length(csid)
sid <- c(MYBIBUSSTOP$MYBI_STOPID)
length(sid)

head(MYBICARDHISTORY)
str(MYBICARDHISTORY)
distinct(MYBICARDHISTORY, MYBICARDHISTORY$STOP_ID)

####### MERGE MYBICARDHISTORY & MYBIBUSSTOP ########

MYBIBUSSTOP$STOP_ID_NEW<-MYBIBUSSTOP$MYBI_STOPID
head(MYBIBUSSTOP)

MYBICARDHISTORY$STOP_ID_NEW<-MYBICARDHISTORY$STOP_ID
head(MYBICARDHISTORY)

df<-merge(MYBICARDHISTORY, MYBIBUSSTOP, by= 'STOP_ID_NEW', all.y=T)
length(df$STOP_ID_NEW)
str(df)
head(df)

df<-na.omit(df)
head(df)
length(df$STOP_ID_NEW)

### 지도 그리기 ###

gu2 <- get_map("ulsan", zoom=12, maptype = "roadmap")
ggmap(gu2)

df.map <- ggmap(gu2) + geom_point(data=df, aes(x=df$STOP_X2, y=df$STOP_Y2), size=0.5, alpha=0.6, color="green")  
df.map

### 변수에 따른 크기와 색깔 변화 적용

str(df)
head(df)

df.map <- ggmap(gu2) + geom_point(data=df, aes(x=df$STOP_X2, y=df$STOP_Y2), 
                                  size=ifelse(df$SUMAMOUNT == 0, 0.5, ifelse(df$SUMAMOUNT >= 3000, 2, 1)), 
                                  alpha=0.6, 
                                  color=ifelse(df$SUMAMOUNT == 0, "black", ifelse(df$SUMAMOUNT >= 3000,'green','yellow')))  
df.map

plot(df$SUMAMOUNT)

# G 0
# F 0~1000
# E 1000~2000
# D 2000~3000
# C 3000~4000
# B 4000~5000
# A 5000~

############# BUS STOP의 SUMMOUNT(총액)을 grade로 구분하여 표현

df <- within(df,{
  grade = character(0)
  grade[df$SUMAMOUNT == 0] = "G"
  grade[df$SUMAMOUNT > 0 & df$SUMAMOUNT <= 1000] = "F"
  grade[df$SUMAMOUNT > 1000 & df$SUMAMOUNT <= 2000] = "E"
  grade[df$SUMAMOUNT > 2000 & df$SUMAMOUNT <= 3000] = "D"
  grade[df$SUMAMOUNT > 3000 & df$SUMAMOUNT <= 4000] = "C"
  grade[df$SUMAMOUNT > 4000 & df$SUMAMOUNT <= 5000] = "B"
  grade[df$SUMAMOUNT > 5000] = "A"
  grade = factor(grade, level=c("G","F","E","D","C","B","A"))
})

head(df)
str(df)

levels(df$grade)
plot(df$grade)

## 지도에 그리기
n<-length(levels(df$grade))
mycolors <- rainbow(n)
gu2 <- get_map("ulsan", zoom=12, maptype = "roadmap")
ggmap(gu2)

df.map <- ggmap(gu2) + geom_point(data=df, aes(x=df$STOP_X2, y=df$STOP_Y2),
                                  alpha=0.6,
                                  show.legend=TRUE,
                                  size=ifelse(df$grade == "A", 5, 
                                              ifelse(df$grade == "B", 4, 
                                                     ifelse(df$grade == "C", 3, 
                                                            ifelse(df$grade == "D", 2,
                                                                   ifelse(df$grade == "E", 1,
                                                                          ifelse(df$grade == "F", 0.8,
                                                                                 ifelse(df$grade == "G", 0.5, 0
                                                                                        )
                                                                                 )
                                                                          )
                                                                  )
                                                            )
                                                    )
                                            ),

                                  color=ifelse(df$grade == "A", "red", 
                                               ifelse(df$grade == "B", "orange", 
                                                      ifelse(df$grade == "C", "yellow", 
                                                             ifelse(df$grade == "D", "green",
                                                                    ifelse(df$grade == "E", "blue",
                                                                           ifelse(df$grade == "F", "navy",
                                                                                  ifelse(df$grade == "G", "purple", "black"
                                                                                         )
                                                                                  )
                                                                           )
                                                                    )
                                                             )
                                                      )
                                               )
                                  )
                                  
df.map












################## END #################









BITBUSSTOP<-read.csv("./제공용/csv파일/BITBUSSTOP.csv")
str(BITBUSSTOP)

plot(BITBUSSTOP$STOP_ID)
BITBUSSTOP$STOP_NAME



###############################################
BUSBOPHISTORY<-read.csv("./제공용/csv파일/BUSBOPHISTORY.csv")
str(BUSBOPHISTORY)
summary(BUSBOPHISTORY)

plot(BUSBOPHISTORY$bop_violationinfo)
################################################################################################
str(BITBUSSTOP)
x<-BITBUSSTOP$STOP_X
y<-BITBUSSTOP$STOP_Y
a<-BITBUSSTOP$STOP_ADMIN
plot(x, y, xlab="X",ylab="Y",col = ifelse(a == "울산광역시",'red', 
                          ifelse(a == "부산광역시",'green','blue')), pch = 19)

legend("bottomright", legend=c("울산광역시", "부산광역시","양산시"), col=c("red", "blue","green"), lty=20 ,cex=0.8)
plot(BITBUSSTOP$STOP_ADMIN)
#######################################################################################
#### BUSCOMPANY

BUSCOMPANY<-read.csv("./제공용/csv파일/BUSCOMPANY.csv")
length(BUSCOMPANY$bcp_name)
plot(BUSCOMPANY$bcp_name)
str(BUSCOMPANY)

library(dplyr)
distinct(BUSCOMPANY, BUSCOMPANY$bcp_name)

##############################################################################################################
## MYBIBUSSTOP

MYBIBUSSTOP<-read.csv("./제공용/csv파일/MYBIBUSSTOP.csv")
MYBIBUSSTOP$STOP_X
MYBIBUSSTOP$STOP_Y
MYBIBUSSTOP$STOP_X2
MYBIBUSSTOP$STOP_Y2

str(BITBUSSTOP)
head(BITBUSSTOP)
bs<-subset(BITBUSSTOP, select=c(STOP_X, STOP_Y))
head(bs)

head(MYBIBUSSTOP)
mbs<-subset(MYBIBUSSTOP, select=c(STOP_X,STOP_Y, STOP_X2, STOP_Y2))
head(mbs)

c(MYBIBUSSTOP$MYBI_STOPID)
c(BITBUSSTOP$STOP_ID)
