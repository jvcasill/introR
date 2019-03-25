# Load tidyverse
library(tidyvferse)




# Take a look at 'mtcars' dataset
glimpse(mtcars)
dim(mtcars)
head(mtcars, 15)
summary(mtcars)





# The basics for making a plot
mtcars %>%
  ggplot(., )




# Call dataframe and 'pipe' into ggplot function
# Add aesthetic mapping to x and y axis
mtcars %>%  
  ggplot(., aes(x = disp, y = mpg))






# Call dataframe and 'pipe' into ggplot function
# Add aesthetic mapping to x and y axis
# Add geometric object (geom_point)
mtcars %>%  
  ggplot(., aes(x = disp, y = mpg)) + # We 'add' a layer to the plot
  geom_point()                        # <- this line gives you points


#
# Exercise
#
#
# Recall that mtcars has a lot of variables (see glimpse(mtcars))
# - Try swapping other variables for x and y
# 
# There are many types of geoms, try adding them to your plot
# - geom_point()
# - geom_smooth()
# - geom_hist()
# - geom_bar()
# - geom_boxplot()
#
# More...
# - Add a smoother to the plot (geom_smooth())
# - Add more aesthetics (try color and shape). What happens?
# - Add a geom to make a boxplot




# Histograms
# Bargraphs
# Boxplots
# Scatter plots

mtcars %>% 
  ggplot(., aes(x = disp, y = mpg)) + 
    geom_point()




#
# More examples
#

# Mean +/- SD
mtcars %>%
  ggplot(., aes(x = am, y = mpg)) + 
  stat_summary(fun.data = mean_sdl, 
               geom = 'pointrange')




#
# Faceting
#

mtcars %>% 
  ggplot(., aes(x = am, y = mpg)) + 
  stat_summary(fun.data = mean_sdl, 
               geom = 'pointrange') + 
  facet_grid(. ~ cyl)


#
# More practice
#
#
# Using mtcars, create the following...
# - a boxplot with a variable mapped to the fill aesthetic
# - a boxplot with a variable mapped to the color aesthetic and a horizontal facet
# - a scatterplot with a regression line (see ?geom_smooth)
# - a scatterplot with a regression line (see ?geom_smooth) and a categorical factor (try the aesthetic shape)
# - a histogram of mpg
# - What does geom_violin() do? What geom can it replace?



