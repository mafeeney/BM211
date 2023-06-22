#example 1 - number of cyanobacteria found in different Winogradsky columns (each set up with sediment from a different lake)

#load the data (stolen from the Weissgerber paper)
WinogradskyCounts <- read.csv("WinogradskyCounts.csv")

#check that the data have loaded
View(WinogradskyCounts)

#plot the data in different ways

#one, a bar graph

p1 <- ggplot(WinogradskyCounts, aes(x = column, y = cyanos)) +
  geom_bar(stat = "identity") +
  labs(x = "Column", y = "Number of cyanobacteria")

print(p1)

#add error bars to the bar graph (standard deviation)

p1 <- ggplot(WinogradskyCounts, aes(x = column, y = cyanos)) +
  geom_bar(stat = "identity") +
  geom_errorbar(aes(ymin = cyanos - sd(cyanos), ymax = cyanos + sd(cyanos))) +
  labs(x = "Column", y = "Number of cyanobacteria")

print(p1)

#two, a scatterplot


p2 <- ggplot(WinogradskyCounts, aes(x = column, y = cyanos)) +
  geom_point() +
  labs(x="Column", y="Number of cyanobacteria") 

print(p2)

#three, a boxplot

p3 <- ggplot(WinogradskyCounts, aes(x = column, y = cyanos)) +
  geom_boxplot(aes(group = column)) +
  labs(x = "Column", y = "Number of cyanobacteria")

print(p3)

#four, a violinplot
p4 <- ggplot(WinogradskyCounts, aes(x = column, y = cyanos)) +
  geom_violin() +
  labs(x = "Column", y = "Number of cyanobacteria")

print(p4)

#Discussion points for students: 
#which of the plots is "best"/most effective/most useful? 
#how would you interpret these data? Which column do you think has the most cyanobacteria? 
#are there any flaws in the experimental design? 
#can you think of other ways to visualise and/or present these data? (does the audience you are presenting the data to matter?)

#next, students to plot own datasets (need to generate more datasets for this....) 
