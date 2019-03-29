rm(list=ls())

install.packages("reshape")
library(reshape)

country<-c("China","USA","Japan")
GDP2000<-c(5000,6000,7000)
GDP2005<-c(5500,6500,7500)
GDP2010<-c(5010,6010,7001)
developed<-as.factor(c(0,1,1))
Data<-data.frame(country,developed,GDP2000,GDP2005,GDP2010)
Data

long<-reshape(Data,idvar = "Country",varying = list(names(Data)[3:5]),
              v.names = "GDP", timevar = "year", times = c(2000,2005,2010), direction = "long")
long
long<-long[order(long$country,long$year), ]
long

wide<-reshape(long, v.names = "GDP", idvar="country", timevar = "year", direction = "wide")
wide