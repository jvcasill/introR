###############################################################################
# Intro to R                                                                  #
# Joseph V. Casillas, PhD                                                     #
# 10/02/2016                                                                  #
###############################################################################

# clean working directory
rm(list = ls(all = TRUE))

# Install required packages
packages <- c("ggplot2", "dplyr", "tidyr", "lme4", "devtools")
if (length(setdiff(packages, rownames(installed.packages()))) > 0) {
  install.packages(setdiff(packages, rownames(installed.packages())))  
}

# Load packages
library(tidyr); library(dplyr); library(ggplot2); library(lme4); 
library(devtools)


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
set.seed(1)
x <- seq(1:30)
g <- gl(n = 2, k = 15, length = 30, labels = c('females', 'males'))
y.iq <- rnorm(n = 30, mean = 115, sd = 25)
y.wt <- rnorm(n = 30, mean = 170, sd = 50)
y.ht <- rnorm(n = 30, mean = 60, sd = 15)

# Store data in dataframe called 'df'
# 'df' has a column for subjects, group, IQ, weight, and height
df <- data.frame(subj = x, 
                 group = g, 
                 iq = y.iq, 
                 wt = sort(y.wt), 
                 ht = y.ht)

# Let's take a look at 'df'
head(df, n = 10)

# Let's see the structure (str) of 'df'
str(df)

# Subsets: row 1 (first participant), all columns
df[1, ]

# Subsets: all rows, first column (subj identification column)
df[, 1]

# How can we see the 10th row of the 3rd column?

# How can we rows 10 through 15, all columns?

# Let's create a subset and perform an operation on it 
# We will calculate the mean IQ of just the male participants
mean(df[df$group == 'males', 'iq'])

# This is equivilant to...
mean(df[16:30, 3])





######################
# Data visualization #
######################


# Basic example 
ggplot(data = df, aes(x = ht, y = wt)) + 
geom_point()

# Boxplot including all 4 variables (ht, wt, iq, group)
df %>%
  gather(., key = variables, value = value, -subj, -group) %>%
  ggplot(., aes(x = variables, y = value, fill = group)) + 
  geom_jitter() +
  geom_boxplot()






#################
# Data analysis #
#################

# Run a bivariate linear regression
lm(formula = wt ~ ht, data = df) %>% summary

# Run an 1-way between subjects anova 
# (wt as a function of group)
aov(formula = wt ~ group, data = df) %>% summary 






















