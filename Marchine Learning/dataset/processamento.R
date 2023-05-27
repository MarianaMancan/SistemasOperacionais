setwd("C:\\Users\\Mariana\\Documents\\dataset")
dataset <- read.csv("PDFMalware2022.csv",
         header= TRUE,
         stringsAsFactors = TRUE)

dataset <- data.matrix(dataset)



# busca por valores NA
qtddLinhas  <- dim(dataset)[1]
qtddColunas <- dim(dataset)[2]

for(linha in 1:qtddLinhas){
  for(coluna in 1:qtddColunas){
    if(is.na(dataset[linha,coluna]))
      print(linha)
  }
}

dataset <- dataset[-c(2127,2157),]





# busca por valores Inf
qtddLinhas  <- dim(dataset)[1]
qtddColunas <- dim(dataset)[2]

for(linha in 1:qtddLinhas){
  for(coluna in 1:qtddColunas){
    if(is.infinite(dataset[linha,coluna]))
      print(linha)
  }
}







# Normaliza - novos valores entre 0 e 1
qtddLinhas  <- dim(dataset)[1]
qtddColunas <- dim(dataset)[2]
minimo <- min(dataset)
maximo <- max(dataset)


for(linha in 1:qtddLinhas){
  for(coluna in 1:(qtddColunas-1)){
    dataset[linha,coluna] <- ((dataset[linha,coluna] - minimo) / (maximo - minimo))
  }
}

# desabilita view do dataset por notação científica
options(scipen = 999)


# Binarizacao classica das Classes (0 benigno | 1 malicioso)
dataset[,33][dataset[,33] == 2] <- 0  


write.csv(dataset, "PDFMalware2022_pp_not.csv", row.names = FALSE)