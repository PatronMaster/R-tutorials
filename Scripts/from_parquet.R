library(arrow)
library(plyr)
library(tidyverse)
setwd("Change for directory of the files")
files<-list.files(pattern = ".parquet")
readed <- lapply(files, function(file){
  read_parquet(file = file)
})
all_data <- rbind.fill(readed)
write.csv(all_data,file = "parquet.csv")

