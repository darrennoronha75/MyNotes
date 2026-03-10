# --- 1. DATA SETUP ---
state <- c("Delaware", "Iowa", "Michigan", "New Hampshire", "Oklahoma", "Texas", "Wyoming")
mortality <- c(200, 128, 117, 129, 182, 229, 134)
latitude <- c(39, 42, 44, 44, 35, 31, 43)
melanoma_data <- data.frame(state, mortality, latitude)

# --- 2. FIT THE MODEL ---
LM <- lm(mortality ~ latitude, data = melanoma_data)
summary(LM)  # Shows Intercept, Slope, and Sigma (for Part A)

# --- 3. PREDICT FOR OHIO (LATITUDE = 40) ---

# Method A: "By Hand" (Extracting from the model object)
intercept <- coef(LM)[1]
slope <- coef(LM)[2]
ohio_pred_hand <- intercept + (slope * 40)
print(ohio_pred_hand)

# Method B: Using R's Prediction Engine (Automated)
ohio_new <- data.frame(latitude = 40)
ohio_pred_auto <- predict(LM, newdata = ohio_new)
print(ohio_pred_auto)

# --- 4. CONFIDENCE INTERVAL (PART D) ---
# level = 0.9 for the 90% confidence interval requested
conf_interval <- predict(LM, newdata = ohio_new, interval = "confidence", level = 0.9)
print(conf_interval)

#---4.1. Multcomp Usage ----
library(multcomp)
slope_negative <- glht(lm, linfct="latitude>=0")
summary(slope_negative)

#Ohio Case
prediction_ohio <- glht(lm, linfct="(Intercept)+40*(latitude)=0")
summary(prediction_ohio)
confint(prediction_ohio, level=0.9)

# --- 5. VISUALIZATION ---
plot(latitude, mortality, main="Melanoma vs Latitude", pch=19)
abline(LM, col="blue")                                  # Regression line
points(40, ohio_pred_auto, col="red", pch=18, cex=2)    # Ohio prediction point