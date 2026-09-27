library(readr)

# Load the data
insurance <- read_csv("insurance.csv")
View(insurance)

# Check for missing values
sum(is.na(insurance))
# There are no missing values in the dataset

# Check the structure of the dataset
str(insurance)

# Check the summary statistics of the dataset
summary(insurance)

#correlation matrix for charges
correlation_matrix <- cor(insurance[, c("age", "bmi", "children", "charges")])
print(correlation_matrix)


# Fit a multiple linear regression model

install.packages("stargazer")
library(stargazer)


model <- lm(charges ~ age + bmi + children + sex + smoker, data = insurance)
stargazer(model, type = "text", title = "Linear Regression Results", digits = 2)

# Check the residuals of the model
par(mfrow = c(2, 2))
plot(model)

# Check the VIF for multicollinearity
install.packages("car")
library(car)
vif(model)

# Check the normality of residuals
shapiro.test(residuals(model))
# Check the homoscedasticity of residuals

library(lmtest)
bptest(model)

par(mfrow = c(1, 1))
