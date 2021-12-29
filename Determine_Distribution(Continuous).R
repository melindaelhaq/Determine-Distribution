#Packages
library(ggplot2)
library(Hmisc)
library (pastecs)
library(moments)
library(fitdistrplus)
library(logspline)
library(gamlss) 

#input data
data <- read.csv("locaion and name of the data.csv") #input data with csv format

#Statistic Descriptive
summary (data)     #To show minimum, first quartile (Q1), median (Q2), mean, third quartile (Q3), and maximum of the data
stat.desc (data)   #Show statistic descriptive completely

#Data Shape
skewness (data$BANDUNG.WETAN) #To see the skewness of the data with the specific column name BANDUNG.WETAN
kurtosis (data$BANDUNG.WETAN) #To see the kurtosis

#Plot Data
hist(data$BANDUNG.WETAN, main="Waktu Antar Harian Penderita Covid-19 di Bandung Wetan", xlab="Waktu Antar Harian", ylab="Jumlah Waktu Antar Harian", ylim=c(0,50), xlim=c(0,70)) #Show a histogram of data, we can see the shape of the data and estimate its distribution from the histogram. With main is title of the plot and a horizontal line (x) from 0 to 70 and a vertical line (y) from 0 to 50

#Determine Distribution
descdist(data$BANDUNG.WETAN, discrete = F) #To determine a continuous distribution that fits the data. by looking at the position of the data (blue dots on the plot) whose position is in the distribution area

#Trying to determine the continuous distribution one by one
fit.exp1 <- fitdist(data$BANDUNG.WETAN, "exp") #To find the parameter value of the exponential distribution
plot(fit.exp1) #To see density, cumulative distribution function, and normality of the data
summary(fit.exp1) #To see estimate rate and standard error value, also AIC and BIC of the data distribution.AIC and BIC values are used as a comparison for selecting the best distribution.
fit.gam1 <- fitdist(data$BANDUNG.WETAN, "gamma") #To find the parameter value of the gamma distribution
plot(fit.gam1)
summary(fit.gam1)
#You can also try for other distributions. for uniform distribution, change the script in the distribution section to "unif", if you want to try normal distribution, then change it to "norm".