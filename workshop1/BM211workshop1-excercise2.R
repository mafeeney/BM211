#exercise 2 - analysing alpha diversity over time after an oil spill
#example 1: 

#start by loading the necessary packages with the "library" command: here we will be using ggplot2 and vegan
library(ggplot2)
library(vegan)

#if your version of R studio does not have these packages installed, you can add them with the command: install.packages("vegan")

#load the data we are using for this exercise (you can download it from MyPlace if you are following it along; make sure to save it in your
#current working directory [you can check where your current working directory is, using getwd() if you are uncertain.])

getwd()

#when I load the data, I am going to store it in a variable called OTUs, this should then appear in my environment

OTUs <- read.csv("OilSpillOTUs.csv")

#I can check that the data have loaded using the View command
View(OTUs)

#Now that we have loaded the data, let's explore some of the different ways we can visualise it




#Discussion points for the class: 
#which of the plots is "best"/most effective/most useful? 
#how would you interpret these data? Which column do you think has the most cyanobacteria? 
#are there any flaws in the experimental design? 
#can you think of other ways to visualise and/or present these data? (does the audience you are presenting the data to matter?)

#next, students to plot own datasets using the same method (WinogradskyGreenSulfurCounts.csv, WinogradskyPurpleSulfurCounts.csv, WinogradskyClostridiaCounts.csv)

#Leighton should we think about adding some statistics too?


