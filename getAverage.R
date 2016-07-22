require(openxlsx)
fileName <-"2015 employee.xlsx"
dataFrame <- read.xlsx(fileName,colNames = T)
dataFrame[dataFrame=="N"]<-NA
dat <- as.data.frame(sapply(dataFrame, as.numeric)) #<- sapply is here
dat$Leader<-rowMeans(subset(dat,
select=c("Q2","Q13","Q14","Q19","Q20","Q24","Q29","Q40","Q47","Q61")),
na.rm=T)
dat$peer<-rowMeans(subset(dat,
                            select=c("Q5","Q11","Q36","Q39","Q51","Q55","Q58")),
                     na.rm=T)
dat$stake<-rowMeans(subset(dat,
                          select=c("Q1","Q7","Q22","Q23","Q25","Q31","Q33","Q43")),
                   na.rm=T)
dat$motive<-rowMeans(subset(dat,
                           select=c("Q6","Q16","Q21","Q60")),
                    na.rm=T)
dat$climate<-rowMeans(subset(dat,select=c("Leader","peer","stake","motive")))
newData<-subset(dat,select=c("CNPJ","Leader","peer","stake","motive","climate"))
write.xlsx(newData,"2015-cnpj-summary.xlsx")