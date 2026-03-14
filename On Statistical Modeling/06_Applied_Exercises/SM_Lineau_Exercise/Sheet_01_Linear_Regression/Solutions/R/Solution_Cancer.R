Cancer<-data.frame(Mortality=c(200,128,117,129,182,229,134), Latitude=c(39,42,44,44,35,31,43))

plot(Cancer$Latitude,Cancer$Mortality, xlab="Latitude", ylab="Mortality")

LM<-lm(Mortality~Latitude,Cancer)

LM

abline(LM)

LM$residuals

sum(LM$residuals^2)/5

sqrt(sum(LM$residuals^2)/5)

LM$coefficients[1]+40*LM$coefficients[2]

predict(LM, data.frame(Latitude=40))

library(multcomp)

Slope_negative<-glht(LM,linfct="Latitude>=0")

summary(Slope_negative)

confint(Slope_negative)

summary(LM)

Prediction_Ohio<-glht(LM,linfct="(Intercept)+40*Latitude=0")

confint(Prediction_Ohio,level=0.9)