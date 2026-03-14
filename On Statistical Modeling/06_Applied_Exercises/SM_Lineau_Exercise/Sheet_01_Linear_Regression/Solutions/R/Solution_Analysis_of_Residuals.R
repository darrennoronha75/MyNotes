
setwd("C:/Users/Matthias Schulte/Desktop/Statistical Models/Übungen/Exercise 1/")

Residuals_Gaussian<-read.csv("Residuals_Gaussian.csv")

LM1<-lm(Y1~U, Residuals_Gaussian)
plot(Residuals_Gaussian$U, Residuals_Gaussian$Y1, xlab="U", ylab="Y1")
abline(LM1)
qqnorm(LM1$residuals)
qqline(LM1$residuals)
plot(LM1$fitted.values,LM1$residuals)

plot(Residuals_Gaussian$U, Residuals_Gaussian$Y2, xlab="U", ylab="Y2")
LM2<-lm(Y2~U, Residuals_Gaussian)
abline(LM2)
qqnorm(LM2$residuals)
qqline(LM2$residuals)
plot(LM2$fitted.values,LM2$residuals)

plot(Residuals_Gaussian$U, Residuals_Gaussian$Y3, xlab="U", ylab="Y3")
LM3<-lm(Y3~U, Residuals_Gaussian)
abline(LM3)
qqnorm(LM3$residuals)
qqline(LM3$residuals)
plot(LM3$fitted.values,LM3$residuals)