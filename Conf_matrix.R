logRegPrediction <- predict(logisticRegModel, testDataFiltered)
logRegConfMat <- confusionMatrix(logRegPrediction, testDataFiltered[,"ARR_DEL15"])
logRegConfMat

