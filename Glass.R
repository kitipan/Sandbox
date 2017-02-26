library(readr)
library(ggplot2)
library(dplyr)
library(party)
library(caTools)

glass <- read_csv("D:/Dropbox/RKit/Glass/glass.csv")

#Add Type_Attribute for better understanding
Type_Attribute <- c("building_float", "building_non_float", "vehicle_float", "containers", "tableware", "headlamps")
Type_No <- c(1,2,3,5,6,7)
Type_map <- cbind(Type_No, Type_Attribute)
Glass1 <- merge(glass, Type_map, by.x = "Type", by.y = "Type_No")
plot(Glass1$Type_Attribute)

#check coefficient
cor(Glass1[,-11])
#Na, Al, and Ba have strong Cor with Type

plot(Glass1$Type_Attribute, Glass1$Na)
plot(Glass1$Type_Attribute, Glass1$Al)
plot(Glass1$Type_Attribute, Glass1$Ba)

# Could reduce dimension using pCA but later
# prepare train and set data set
set.seed(1348)
trainData <- Glass1[sample(1:nrow(Glass1),200,replace=FALSE),]
testData <- Glass1[sample(1:nrow(Glass1), 50,replace=FALSE),]
#sampleset <- sample(2, nrow(Glass1), replace=TRUE, prob = c(0.7,0.3) )
#train <- Glass1[sampleset==1,]
#test <- Glass1[sampleset==2,]

#using Decision Tree
GlassForm <- Type_Attribute~Na+Al+Ba
Glass_ctree <- ctree(GlassForm, data = trainData)

#check the prediction
print(Glass_ctree)

table(predict(Glass_ctree), trainData$Type_Attribute)

#test with test data
testresult <- predict(Glass_ctree, newdata = testData)
table(testresult, testData$Type_Attribute)

#check percent correct
sum(diag(table(testresult, testData$Type_Attribute)))/nrow(testData)
