#additional examples for practice with ggplot2

#start by loading the necessary packages with the "library" command: here we will be using ggplot2
library(ggplot2)

#Extra Practice Problem 1: the ability of rhizobia to form nodules on Phaseolus vulgaris roots
#we have wild-type rhizobia, and a mutant (nodA-) strain
#the mutant strain has been complemented (the nodA gene restored in trans)
#so there are two additional strains (nodA/pSc101, which has the empty vector used for complementation; 
#and nodA/pSC101-nodA, which has the nodA gene added back)
#equal amounts of all 4 strains were inoculated on Phaseolus vulgaris roots, and the number of nodules per plant counted
#these data are provided in the RhizobiaNodulation.csv file

rhizo <- read.csv("RhizobiaNodulation.csv")

#I can check that the data have loaded using the View command
View(rhizo)

#visualise the data

#Define the desired order of the groups (to appear on the x-axis)
desired_order <- c("wt", "nodA", "nodA/pSC101", "nodA/pSC101-nodA")  

# Reorder the 'name' variable as a factor with the desired order
rhizo$name <- factor(rhizo$name, levels = desired_order)

# Create the ggplot with the modified order of groups
rhizoplot <- ggplot(rhizo, aes(x = name, y = nodules)) +
  geom_boxplot(aes(group = name)) +
  labs(x = "Strain", y = "Number of nodules/plant")

print(rhizoplot)

#Extra Practice Problem 2: 







