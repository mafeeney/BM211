#exercise 1 - making simple plots and visualising data using R Studio and ggplot2
#example 1: analyse the number of cyanobacteria found in different Winogradsky columns (each set up with sediment from a different lake)

#start by loading the necessary packages with the "library" command: here we will be using ggplot2
library(ggplot2)

#load the data we are using for this excrcise (you can download it from MyPlace if you are following it along; make sure to save it in your
#current working directory [you can check where your current working directory is, using getwd() if you are uncertain.])

getwd()

#when I load the data, I am going to store it in a variable called Cyanos, this should then appear in my environment

Cyanos <- read.csv("WinogradskyCyanoCounts.csv")

#I can check that the data have loaded using the View command
View(Cyanos)

#Now that we have loaded the data, let's explore some of the different ways we can visualise it

#plot one, a bar graph

p1 <- ggplot(Cyanos, aes(x = column, y = cyanos)) +
  geom_bar(stat = "identity") +
  labs(x = "Column", y = "Number of cyanobacteria")

print(p1)

#add error bars to the bar graph (standard deviation)





#plot two, a scatterplot


p2 <- ggplot(Cyanos, aes(x = column, y = cyanos)) +
  geom_point() +
  labs(x="Column", y="Number of cyanobacteria") 

print(p2)

#plot three, a boxplot

p3 <- ggplot(Cyanos, aes(x = column, y = cyanos)) +
  geom_boxplot(aes(group = column)) +
  labs(x = "Column", y = "Number of cyanobacteria")

print(p3)

#plot four, a violinplot
p4 <- ggplot(Cyanos, aes(x = column, y = cyanos)) +
  geom_violin(aes(group = column)) +
  labs(x = "Column", y = "Number of cyanobacteria")

print(p4)

#Discussion points for the class: 
#which of the plots is "best"/most effective/most useful? 
#how would you interpret these data? Which column do you think has the most cyanobacteria? 
#are there any flaws in the experimental design? 
#can you think of other ways to visualise and/or present these data? (does the audience you are presenting the data to matter?)

#next, students to plot own datasets using the same method (WinogradskyGreenSulfurCounts.csv, WinogradskyPurpleSulfurCounts.csv, WinogradskyClostridiaCounts.csv)

#Leighton should we think about adding some statistics too?


