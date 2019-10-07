

sink("a_out", append=FALSE, split=FALSE)
pdf("a_out.pdf")
library(MASS)
Animals
m1<-lm(log(brain)~log(body),data=Animals)
str(m1)

plot(log(Animals$brain)~log(Animals$body))
abline(m1$coef, lty="dotted")
dev.off()

