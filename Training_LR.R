library(caret)
set.seed(122515)
featureCols <- c("ARR_DEL15", "DAY_OF_WEEK", "CARRIER", "DEST", "ORIGIN", "DEP_TIME_BLK")
onTimeDataFiltered <- onTimeData[,featureCols]
inTrainRows <- createDataPartition(onTimeDataFiltered$ARR_DEL15, p=0.70, list = FALSE)
head(inTrainRows)
trainDataFiltered <- onTimeDataFiltered[inTrainRows,]
testDataFiltered <- onTimeDataFiltered[-inTrainRows,]
nrow(trainDataFiltered)/(nrow(testDataFiltered) + nrow(trainDataFiltered))
logisticRegModel <- train(ARR_DEL15 ~ ., data = trainDataFiltered, method = "glm", family="binomial")
