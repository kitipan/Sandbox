library(readr)
library(arules)

#kit.csv obtained from 
kit <- read_csv("C:/Users/kitipan/Desktop/kit.csv", 
                col_names = FALSE, na = "null")
kit4 <- as.data.frame(unclass(kit))
trans3 <-  as(kit4, "transactions")
inspect(trans3[1:10,])


