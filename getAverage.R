library(openxlsx)
fileName <-"2011 employee.xlsx"
dataFrame <- read.xlsx2(fileName,sheetIndex=1,header=T,colClasses=NA)
dataFrame<-as.numeric(dataFrame)
dataFrame$Leader<-rowMeans(subset(dataFrame,
select=c("Q2","Q13","Q14","Q19","Q20","Q24","Q29","Q40","Q47","Q61")),
na.rm=T)