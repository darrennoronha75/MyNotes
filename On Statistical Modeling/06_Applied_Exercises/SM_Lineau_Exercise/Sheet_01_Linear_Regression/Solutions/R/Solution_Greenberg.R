
setwd("C:/Users/darre/OneDrive - hexcoder/Darren/Personal/Backups/Desktop/Learning/TUHH/MyNotes/On Statistical Modeling/06_Applied_Exercises/SM_Lineau_Exercise/Sheet_01_Linear_Regression/Solutions/R")

Greenberg<-read.csv("Greenberg.csv")

Greenberg
boxplot(height~school,Greenberg)

LM0<-lm(height~school, Greenberg)

LM0

summary(LM0)

plot(Greenberg$age[1:18],Greenberg$height[1:18], col="blue", pch=19, xlab="age", ylab="height")
points(Greenberg$age[19:32],Greenberg$height[19:32], col="red", pch=19)

LM1<-lm(height~school+age, Greenberg)

LM1

abline(LM1$coefficients[1], LM1$coefficients[3], col="blue")
abline(LM1$coefficients[1]+LM1$coefficients[2], LM1$coefficients[3], col="red")

summary(LM1)

LM2<-lm(height~school+age+school*age, Greenberg)
summary(LM2)
