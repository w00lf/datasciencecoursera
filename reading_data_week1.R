# Question №5, data.tables
# Install data.tables!
file <- download.file('https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv',  'UScommunities-2006(5 assign).csv')
x <- fread('UScommunities-2006(5 assign).csv')
install.packages('rbenchmark')
library(rbenchmark)
benchmark(DT[,mean(pwgtp15),by=SEX], mean(DT$pwgtp15,by=DT$SEX), tapply(DT$pwgtp15,DT$SEX,mean), mean(DT[DT$SEX==1,]$pwgtp15); mean(DT[DT$SEX==2,]$pwgtp15), sapply(split(DT$pwgtp15,DT$SEX),mean))
