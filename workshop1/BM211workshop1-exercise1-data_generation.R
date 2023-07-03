## BM211workshop1-exercise1-data_generation.R

# This R script generates a set of random data representing a Winogradsky
# column experiment, for use in Exercise 1 for BM211 Workshop 1
#
# The presumed experimental setup is that each student prepares a column from 
# a different source (so that there are different bacterial communities in each
# column), and that each column is sampled `n_replicates` times, with each
# replicate being grown on the media listed in `media`.
#
# The data generation process is:
# For each student:
#    - generate a random (runif, [0-60]) number vector of colony counts for 
#      each medium
#    - For each replicate:
#         - generate a vector of random numbers from the colony count vector:
#           use the colony count as the mean for a Normal distribution (rnorm)
#           with s.d. being 10% of the colony count
#         - make sure there are no negative values
# Combine this data into a dataframe     

# Parameters
#
# We want to be able to control the numbers of students and replicates, and
# control the proportion of the mean colony count used for standard deviation.

n_students = 5    # number of students
n_replicates = 3  # number of replicate samples from each column
sd_prop = 0.25    # proportion of the mean colony count to use as stdev
min_colonies = 0  # minimum mean colony count
max_colonies = 60 # maximum mean colony count
media = c("cyanobacteria", "clostridia", "green sulfur", "purple sulfur")  # names for media

# Create the dataframe of random data
# - each student ID is repeated once for each combination of medium and
#   replicate
columnID = rep(seq(n_students), each=length(media) * n_replicates)  

# - each medium, and each mean value is repeated `n_replicates` times for
#   each student. This would benefit from a bit of extra commenting, so...
# - for `replicate`, we want a vector of media names, repeating for each
#   combination of student and replicate
replicate = paste0("rep_", as.character(rep(seq(n_replicates), each=length(media), times=n_students)))
medium = rep(media, n_replicates * n_students)

# - for `colony_mean` (which won't be in the final dataset) we generate a
#   set of random numbers for one column, covering the list of media:
#   `runif(len(media), min_colonies, max_colonies)`
#   and replicate this for the appropriate number of replicates:
#   `rep([RANDOM COUNTS FOR A COLUMN], n_replicates)`
#   we use as.integer() because we only have whole number colony counts
#   we `replicate()` this action for each column (same thing as each student):
#   `replicate(n_students, [VECTOR OF RANDOM NUMBERS])`
#   this requires `replicate` as that applies the randomisation each time,
#   but it gives us a matrix, so we turn that into a vector with:
#   `as.vector([RANDOM COLONY COUNTS FOR EACH STUDENT])`
colony_mean = as.vector(replicate(n_students, as.integer(rep(runif(length(media), min_colonies, max_colonies), n_replicates))))

# - now we generate the actual random data to be used in the exercise data.
#   This involves generating a new vector from `colony_mean`, using those values
#   as means in `rnorm()` with s.d. proportional to the size of the mean
colony_count = as.integer(rnorm(length(colony_mean), colony_mean, sd=sd_prop * colony_mean))

# - we can now combine these data into a single dataframe, and write it to a
#   suitable file
exercise_data = data.frame(columnID, replicate, medium, colony_count)
write.csv(exercise_data, "BM211_workshop1_case1.csv", row.names=FALSE)


