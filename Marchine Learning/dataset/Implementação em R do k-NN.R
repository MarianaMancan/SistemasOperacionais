#install.packages("caret")

library(caret)



setwd("C:\\Users\\Mariana\\Documents\\dataset")

dataset <- read.csv("PDFMalware2022_pp_not.csv",
                    
                    header = TRUE,
                    
                    stringsAsFactors = TRUE)





smp_size <- floor(0.75 * nrow(dataset))

index <- sample(seq_len(nrow(dataset)), size = smp_size)



training <- dataset[index,]

testing <- dataset[-index,]



training[["Class"]] <- factor(training[["Class"]])

testing[["Class"]] <- factor(testing[["Class"]])



controleTreinamento <- trainControl(method = "repeatedcv",
                                    
                                    number = 10)



ids <- train(Class ~.,
             
             data = training,
             
             method = "knn",
             
             trControl = controleTreinamento,
             
             tuneLength = 10)





deteccao <- predict(ids, newdata = testing)

confusionMatrix(deteccao, testing$Class)