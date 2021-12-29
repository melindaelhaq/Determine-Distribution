#Packages
library(ggplot2)
library(Hmisc)
library(fitdistrplus)
library(logspline)
library(gamlss) 
library (pastecs)
library(moments)
library(ParetoPosStable)

#Input Data
data <- read_excel("location and name of data") #input data with xlsx format

#Statistic Descriptive
summary (data)     #To show minimum, first quartile (Q1), median (Q2), mean, third quartile (Q3), and maximum of the data
stat.desc (data)   #Show statistic descriptive completely

#Data Shape
skewness (data$Arcamanik) #To see the skewness of the data with the specific column name Arcamanik
kurtosis (data$Arcamanik) #To see the kurtosis

#Plot Data
hist(data$Arcamanik, main="Kenaikan Penderita Covid-19 di SWK Arcamanik") #Show a histogram of data, we can see the shape of the data and estimate its distribution from the histogram. With main is title of the plot


#Determine the distribution that fits the data
#Extreme Distribution (Pareto)
(pf1<- pareto.fit(data$Arcamanik, estim.method = "MLE", sigma = NULL)) #To find the parameter value
(pvpf1 <- GoF(pf1, k = 1000, parallel = TRUE, nscore=2)) #to test (KS, AD, and PPS test) the fitting distribution and its p-value which is used to make a decision whether this distribution is suitable or not