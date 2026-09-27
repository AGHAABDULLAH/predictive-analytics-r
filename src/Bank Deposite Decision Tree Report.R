# Import necessary Libraries
  
library(tidyverse)
library(caret)
library(rpart)
library(rpart.plot)
library(ggplot2)
library(readr)


# Load Data 
df <- read_csv("bank.csv")
View(bank)

head(df)
str(df)

# Summary statistics
summary(df)

#Exploratory data analysis

# Check for missing values
sum(is.na(df))
# There is no missing values in the dataset

# Boxplots for numeric columns
boxplot(df$age, main="Boxplot for Age", ylab="Age")
boxplot(df$balance, main="Boxplot for Balance", ylab="Balance")
boxplot(df$duration, main="Boxplot for Duration", ylab="Duration")
boxplot(df$campaign, main="Boxplot for Campaign", ylab="Campaign")
boxplot(df$pdays, main="Boxplot for Pdays", ylab="Pdays")
boxplot(df$previous, main="Boxplot for Previous", ylab="Previous")

# Outlier removal
Q1 <- quantile(df$balance, 0.25)
Q3 <- quantile(df$balance, 0.75)
IQR <- Q3 - Q1
lower_bound <- Q1 - 1.5 * IQR
upper_bound <- Q3 + 1.5 * IQR

df_cleaned <- df %>% filter(balance >= lower_bound & balance <= upper_bound)
summary(df_cleaned)

# Update columns based on conditions

df_cleaned$age <- cut(df_cleaned$age, breaks = c(0, 25, 35, 45, 55, 65, 100), 
                       labels = c("<25", "25-35", "35-45", "45-55", "55-65", "65+"))

df_cleaned$balance <- cut(df_cleaned$balance, breaks = c(-Inf, 0, 1000, 5000, Inf), 
                           labels = c("Negative", "Low", "Medium", "High"))

df_cleaned$duration <- cut(df_cleaned$duration, breaks = c(0, 100, 300, 600, Inf), 
                            labels = c("Short", "Medium", "Long", "Very Long"))

df_cleaned$campaign <- ifelse(df_cleaned$campaign <= 5, "Low", "High")

df_cleaned$previous <- ifelse(df_cleaned$previous == 0, "No Interaction", "Interaction")

# Check the updated data
head(df_cleaned)
summary(df_cleaned)

# Encoding categorical variables
df_encoded <- df_cleaned %>%
  mutate(across(where(is.character), as.factor))

# Check the structure of the data after encoding
str(df_encoded)


# Split the data into Features (X) and Target (y)
X <- df_encoded %>% select(-deposit)
y <- df_encoded$deposit
view(df_encoded)

# Split the data into Training and Test sets
set.seed(123)
trainIndex <- createDataPartition(y, p = 0.9, list = FALSE)
X_train <- X[trainIndex, ]
X_test <- X[-trainIndex, ]
y_train <- y[trainIndex]
y_test <- y[-trainIndex]


# Train a Decision Tree model
dt_model <- rpart(deposit ~ ., data = data.frame(X_train, deposit = y_train), method = "class")

# Print model summary
summary(dt_model)

# Predict using the trained model
y_pred_dt <- predict(dt_model, X_test, type = "class")

# Evaluation metrics
accuracy <- sum(y_pred_dt == y_test) / length(y_test)
precision <- posPredValue(y_pred_dt, y_test, positive = "yes")
recall <- sensitivity(y_pred_dt, y_test, positive = "yes")
f1_score <- 2 * (precision * recall) / (precision + recall)

# Print metrics
cat("Accuracy:", accuracy, "\n")
cat("Precision:", precision, "\n")
cat("Recall:", recall, "\n")
cat("F1-score:", f1_score, "\n")


# Visualize the decision tree
rpart.plot(dt_model, type = 3, extra = 102, main = "Decision Tree for Bank Deposit Prediction")

