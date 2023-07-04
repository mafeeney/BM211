## exercise 1 - making simple plots and visualising microbial ecology data using
## R Studio and ggplot2

# Case study 1: Analyse communities cultured from Winogradsky columns (each 
# column was set up with sediment from a different lake)
#
# Summary: A series of Winogradsky columns was set up by students, and each
#          student used sediment from a different lake to start off their
#          column. Three samples from each student's column were cultured on a
#          range of selective media (selecting for cyanobacteria, clostridia,
#          green sulfur, and purple sulfur bacteria). The counts of colonies
#          were recorded for each column.
#
# Dataset: The data is provided in a single comma-separated variable (.csv) file
#          suitable for import into R as a dataframe (like a table). Each row in
#          the dataframe represents a single count of colonies for one of the
#          three replicates in a student's experiment, on one selective medium.
#          The columns in the table represent: columnID, replicate, medium,
#          and colony_count.

# 1. Start by loading necessary and helpful packages with the "library" command
# 
# - ggplot2: this package allows us to generate high-quality graphics with a
#            few simple commands
library(ggplot2)

# 2. Load the data we are using for this exercise (you can download it from
#    MyPlace if you are following it along; make sure to save it in your
#    current working directory
#    The datafile is called: BM211_workshop1_case1.csv
#    NOTE: you can check where your current working directory is, using 
#         `getwd()` if you are uncertain.
getwd()

# Load the data into a variable called case1_data
# This variable will appear in your RStudio Environment window
case1_data <- read.csv("BM211_workshop1_case1.csv")

# You can check that the data have loaded using the View command, or by clicking
# on the variable name in the RStudio Environment window
View(case1_data)

# NOTE: the column names at the top of this view are variable names that we can
#       refer to when we use our data in R, or with ggplot

# 3. Now that we have loaded the data, we can explore some of the different
#    ways to gain insight into the communities in the different columns

# 3.1 A bar graph
#
# We use ggplot to produce our graphs in this workshop.
# NOTE: if you need a reminder of how to use ggplot, please check out the
#       supplementary information at
#       [MyPlace cheat sheets]
#       [Video refreshers]
# Remember, we create our plots using ggplot() and save them into a variable.
# To be neat, we're giving our variables names to make them easier to remember.
#
# The first plot is a simple bar graph of the total number of colony counts
# obtained from each sample site.
# This may not be the most informative plot we draw, but it will remind us of
# how to use ggplot()
#
# We'll put the plot into a variable called `plot1`
# - on the first line, we tell ggplot which data to use (`case1_data`), and what
#   to put on the X- and Y-axes (`aes(x = [COLUMN NAME], y = [COLUMN NAME])`)
# - we can continue the plot on the next line by ending our first line with `+`
# - on the second line we tell ggplot what _kind_ of plot we want. Here we want
#   a bar graph, so we tell it to add `geom_bar()` - the _geometry_ for a bar
#   graph; note that we again continue onto the next line by ending with `+`
# - on the third line, we use `labs()` to add labels and title to the plot
plot1 <- ggplot(case1_data, aes(x = columnID, y = colony_count)) +
  geom_bar(stat = "identity") +
  labs(title = "Total colony count in each column", x = "Column ID", y = "Colony count")
# To view the plot, we can use the `print()` function:
print(plot1)

# Q1) What does the graph show?
# Q2) What information does the graph give you about the composition of the 
#     bacterial communities in each column?

# 3.2 Stacked bar graph: experimental replicates 
#
# The first bar graph we drew represented the total number of colony counts
# obtained from each column. This is interesting information, but it doesn't
# tell us much about: (i) which bacteria are present; (ii) what proportions of
# the total counts correspond to each kind of bacteria; or (iii) how repeatable
# the experiments were.
#
# By changing our visualisation slightly, we can get a better idea of how the
# replicates for each column vary.
#
# To do this, we can add a single extra parameter when we set up our plot:
# `fill = replicate`
# This instruction tells ggplot to use a _stacked bar graph_, where the total
# height of each bar is the same, but the bar is now made up of a stack of
# smaller bars of different colours, each representing a different experimental
# replicate
plot2 <- ggplot(case1_data, aes(x = columnID, y = colony_count, fill = replicate)) +
  geom_bar(stat = "identity") +
  labs(title = "Total colony count in each column, by replicate", x = "Column ID", y = "Colony count")
# To view the plot, we can use the `print()` function:
print(plot2)

# NOTE: ggplot automatically provides a legend corresponding to the categories
#       used to fill the bars

# Q3) What does the graph show?
# Q4) What information does the graph give you about the composition of the
#     bacterial communities in each column?
# Q5) What information does the graph give you about the repeatability of colony
#     counts for each column?

# 3.3 Stacked bar graph: colony types
#
# We can use the same approach as in section 3.2 to display the distribution of
# colony types. This time, instead of using `fill = replicate` when defining
# the graph, we can use `fill = medium`
# We put the resulting graph in the variable called `plot3`
plot3 <- ggplot(case1_data, aes(x = columnID, y = colony_count, fill = medium)) +
  geom_bar(stat = "identity") +
  labs(title = "Total colony count in each column, by medium", x = "Column ID", y = "Colony count")
# To view the plot, we can use the `print()` function:
print(plot3)

# Q6) What does the graph show?
# Q7) What information does the graph give you about the composition of the
#     bacterial communities in each column?
# Q8) What information does the graph give you about the repeatability of colony
#     counts for each column?

# 3.4 Better than bar graphs?: boxplots
#
# Bar graphs may be appropriate for simple count data, but boxplots give us a
# more flexible, nuanced view on our dataset.
# As is usual with `ggplot`, changing the kind of graph we plot can be as easy
# as modifying the _geometry_. Here, we use `geom_boxplot()` instead of 
# `geom_bar()` but, otherwise, this is the same set of commands as example 3.1
plot4 <- ggplot(case1_data, aes(x = columnID, y = colony_count)) +
  geom_boxplot() +
  labs(title = "Boxplot of total colony count per column (three replicates)", x = "Column ID", y = "Colony count")
# To view the plot, we can use the `print()` function:
print(plot4)

# We can stack layers of plots on top of each other using ggplot so, if we want
# to overlay the actual colony counts for each column, we can "add" a 
# `geom_point()` or `geom_jitter()` layer
# NOTE: `geom_point` will give a single vertical line of datapoints;
#       `geom_jitter` moves the points slightly to avoid too much overlap
plot4a <- ggplot(case1_data, aes(x = columnID, y = colony_count)) +
  geom_boxplot() +
  geom_jitter() +
  labs(title = "Boxplot of total colony count per column (three replicates)", x = "Column ID", y = "Colony count")
# To view the plot, we can use the `print()` function:
print(plot4a)

# Q9) What does the graph show?
# Q10) What information does the graph give you about the composition of the
#     bacterial communities in each column?
# Q11) What information does the graph give you about the repeatability of colony
#     counts for each column?

# 3.5 Better than bar graphs?: boxplots
#
# If we want to visualise the distributions of kinds of bacteria next to each
# other, we can change which column we plot on the X-axis, and which column
# we use to decide the fill colour.
# Specifically, we set the X-axis variable to `medium`, and fill to `colonyID`
plot5 <- ggplot(case1_data, aes(x = medium, y = colony_count)) +
  geom_boxplot() +
  geom_jitter() +
  labs(title = "Total colony count in each column", x = "Column ID", y = "Colony count")
# To view the plot, we can use the `print()` function:
print(plot5)

# Using ggplot we can fill each boxplot with a different colour according to a
# column category. This can make it easier for us to compare the counts of each
# bacterium in each column.
plot5a <- ggplot(case1_data, aes(x = medium, y = colony_count, fill = columnID)) +
  geom_boxplot() +
  labs(title = "Total colony count in each column", x = "Column ID", y = "Colony count")
# To view the plot, we can use the `print()` function:
print(plot5a)

# Q12) What does the graph show?
# Q13) What information does the graph give you about the composition of the
#     bacterial communities in each column?
# Q14) What information does the graph give you about the repeatability of colony
#     counts for each column?

## Discussion points for the class: 
#
# - Which of the plots do you think is "best"/most effective/most useful? 
# - How would you interpret these data?
# - Which column do you think has the most cyanobacteria? 
# - Are there any flaws in the experimental design? 
# - Can you think of other ways to visualise and/or present these data? (does 
#   the audience you are presenting the data to matter?)
# - Do the bacterial communities in the individual columns have the same
#   proportions of bacteria?
# - Are all of the column communities equally diverse? (HINT: what do you
#   think we mean by "diverse" in this context?)

#next, students to plot own datasets using the same method (WinogradskyGreenSulfurCounts.csv, WinogradskyPurpleSulfurCounts.csv, WinogradskyClostridiaCounts.csv)

#Leighton should we think about adding some statistics too?


