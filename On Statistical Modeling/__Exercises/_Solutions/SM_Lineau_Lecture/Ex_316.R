data("ToothGrowth")

# lm(len ~ dose, ToothGrowth)
# lm(len ~ dose + supp, ToothGrowth)
lm <- lm(len ~ dose + supp + supp*dose, ToothGrowth)