library(caret)

df <- read.csv('pml-training.csv')
df <- df[,-1]
df <- df[,-2]
df <- df[,-2]
df <- df[,-2]
df <- df[,-2]
df <- df[,-2]
df <- df[,-6]
df <- df[,-6]
df <- df[,-6]
df <- df[,-6]
df <- df[,-6]
df <- df[,-6]
df <- df[,-6]
df <- df[,-6]
df <- df[,-6]
df <- df[,-6]
df <- df[,-6]
df <- df[,-6]
df <- df[,-6]
df <- df[,-6]
df <- df[,-6]
df <- df[,-6]
df <- df[,-6]
df <- df[,-6]
df <- df[,-6]
df <- df[,-6]
df <- df[,-6]
df <- df[,-6]
df <- df[,-6]
df <- df[,-6]
df <- df[,-6]
df <- df[,-19]
df <- df[,-19]
df <- df[,-19]
df <- df[,-19]
df <- df[,-19]
df <- df[,-19]
df <- df[,-19]
df <- df[,-19]
df <- df[,-19]
df <- df[,-19]

df <- df[,-28]
df <- df[,-28]
df <- df[,-28]
df <- df[,-28]
df <- df[,-28]
df <- df[,-28]
df <- df[,-28]
df <- df[,-28]
df <- df[,-28]
df <- df[,-28]
df <- df[,-28]
df <- df[,-28]
df <- df[,-28]
df <- df[,-28]
df <- df[,-28]

df <- df[,-31]
df <- df[,-31]
df <- df[,-31]
df <- df[,-31]
df <- df[,-31]
df <- df[,-31]
df <- df[,-31]
df <- df[,-31]
df <- df[,-31]
df <- df[,-31]
df <- df[,-31]
df <- df[,-31]
df <- df[,-31]
df <- df[,-31]
df <- df[,-31]

df <- df[,-32]
df <- df[,-32]
df <- df[,-32]
df <- df[,-32]
df <- df[,-32]
df <- df[,-32]
df <- df[,-32]
df <- df[,-32]
df <- df[,-32]
df <- df[,-32]

df <- df[,-44]
df <- df[,-44]
df <- df[,-44]
df <- df[,-44]
df <- df[,-44]
df <- df[,-44]
df <- df[,-44]
df <- df[,-44]
df <- df[,-44]
df <- df[,-44]
df <- df[,-44]
df <- df[,-44]
df <- df[,-44]
df <- df[,-44]
df <- df[,-44]

df <- df[,-45]
df <- df[,-45]
df <- df[,-45]
df <- df[,-45]
df <- df[,-45]
df <- df[,-45]
df <- df[,-45]
df <- df[,-45]
df <- df[,-45]
df <- df[,-45]

labelName <- 'classe'
predictors <- names(df)[names(df) != labelName]
set.seed(819)
# used to pass quiz 100%
tobject <- train( df[,predictors], df[,labelName], model='rf')
tt <- read.csv('pml-testing.csv')
preds <- predict(tobject, tt[,predictors])
print(tobject$finalModel)
# B A B A A E D B A A B C B A E E A B B B


model <- train(classe~., data=df, trControl=trainControl(method="cv",number=5), method="rf")
# summarize results
print(model$finalModel)




