setwd("C:/Users/mmm/Downloads/Telegram Desktop/dr hamada/New folder (2)/labs")
getwd()
lab <- read.csv('G3_sydney_hobart_times.csv')
str(lab)
summary(lab)


#manipulate Time variable

lab$Time <- gsub(" day","",lab$Time)
lab$Time <- as.numeric(lab$Time)
class(lab$Time)


#remove code.time.less than3 variable
lab$Code.Time.less.than.3 = NULL

# missing values of Time variable filling

install.packages("mice")
library(mice)
lab[!complete.cases(lab), ]
Pre.imputation <- mice(lab , m = 5, meth = c("pmm"), maxit = 20)
Pre.imputation$imp
lab <- complete(Pre.imputation, 3)





# Data visualization
install.packages("tidyverse")
library(tidyverse)
library(ggplot2)
draw1 <- ggplot(lab)
draw1 <- ggplot(lab, aes(x=fleet_start, y=fleet_finish))
draw1
draw1 + geom_point()


draw_bar <- ggplot(lab, aes(x=Year, fill = Year))
draw_bar + geom_bar()








