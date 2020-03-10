---
title: "Class 5: Data Visualization and graphs in R"
author: "Linh-An Ho"
date: "January 23rd, 2020"
output: github_document
---

#Class 5
#Data Visualization and graphs in R

plot(1:10, col = "blue", typ = "o")

#Need to import/read data file first
baby <- read.table("bimm143_05_rstats/weight_chart.txt", header = 
                     TRUE)

#A basic plot of age vs weight
plot(baby$Age, baby$Weight, typ = "o",
     pch = 15, cex = 1.5, lwd= 2, ylim = c(2,10), 
     xlab = "Age (months)", ylab = "Weight (kg)",
     main = "Baby weight with age")


#Import data for barplot
mouse <-  read.table("bimm143_05_rstats/feature_counts.txt", header = TRUE, sep = "\t")

#Plot features barplot
par(mar=c(5,10,2,1))
barplot(mouse$Count, horiz = TRUE, 
        xlab = "Mouse Count" , names.arg = mouse$Feature,las = 1)

#Import male/female counts
mf <- read.table("bimm143_05_rstats/male_female_counts.txt", sep = "\t", header = TRUE)

#Plot rainbow plot
barplot(mf$Count, col = rainbow(nrow(mf)),
        names.arg = mf$Sample, las=2, 
        ylab="Counts", ylim=c(0,20))

#Assign colors to genders on the plot
barplot(mf$Count, col = c("blue2", "red2"),
        names.arg = mf$Sample, las=2, 
        ylab="Counts", ylim=c(0,20))

