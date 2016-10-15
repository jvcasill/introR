###############################################################################
# Intro to R                                                                  #
# Joseph V. Casillas, PhD                                                     #
# 10/02/2016                                                                  #
###############################################################################

# clean working directory
rm(list = ls(all = TRUE))

# Install required packages
packages <- c("ggplot2", "dplyr", "tidyr", "lme4", "devtools", "lingStuff")
if (length(setdiff(packages, rownames(installed.packages()))) > 0) {
  install.packages(setdiff(packages, rownames(installed.packages())))  
}

# Load packages
library(tidyr); library(dplyr); library(ggplot2); library(lme4); 
library(devtools); library(lingStuff)


#####################
# R as a calculator #
#####################

2 + 2

4^2

(12 * 15) / 2


#############################
# Always comment your code! #
#############################

# This is a comment
2 + 2


##################
# R uses objects #
##################

# Store the value '2' to the object 'x'
x <- 2
print(x)

# Perform an operation on 'x'
x + 4




###################
# Data structures #
###################

# Vectors #

# We will create 3 vectos: x, y, and z
x <- c(1, 2, 3)
y <- c(4, 5, 6)
z <- c('a', 'b', 'c')

# We can use the print function to see the vectors in the console
print(x); print(y); print(z)

# We can perform operations on vectors
# add one to each value in the vector
x + 1 

# add the values in x to the values in y 
x + y 

# add the values of y to the values of z (this gives an error)
y + z



# Matrices #

matrix(1:10, nrow = 5, ncol = 2)



# Dataframes #

# createa a dataframe using the vectors 'x', 'y', and 'z'
testDF <- data.frame(x, y, z)
print(testDF)

# Let's look at some more interesting dataframes
# The head() function shows the 1st six rows of a dataframe
head(mtcars)
head(USArrests)



###########################
# Manipulating dataframes #
###########################

# Create some data to put in a practice dataframe
x <- seq(1:30)
g <- gl(n = 2, k = 15, length = 30, labels = c('females', 'males'))
y.iq <- rnorm(n = 30, mean = 80, sd = 18)
y.wt <- rnorm(n = 30, mean = 170, sd = 50)
y.ht <- rnorm(n = 30, mean = 60, sd = 15)

# Store data in dataframe called 'df'
# 'df' has a column for subjects, group, IQ, weight, and height
df <- data.frame(subj = x, 
                 group = g, 
                 iq = y.iq, 
                 wt = sort(y.wt), 
                 ht = y.ht)






df %>%
  gather(., key = variables, value = value, -subj, -group) %>%
  ggplot(., aes(x = var, y = value, fill = group)) + 
  geom_jitter() +
  geom_boxplot()



