# NHST

# Load libraries
library(tidyverse)


# Create some independent samples data
ind_samp <- tribble(
  ~'name', ~'group', ~'score', 
  'John',  'g1',      250, 
  'Jane',  'g1',      340, 
  'Jimmy', 'g2',      460, 
  'Jessy', 'g2',      200)

# Take a look at the data frame
print(ind_samp)

# t-test: independent 2-group
t.test(score ~ group, data = ind_samp)








# Create some paired samples data
prd_samp <- tribble(
  ~'name',     ~'test1', ~'test2', 
  'Mike',      35,       67, 
  'Melanie',   50,       46, 
  'Melissa',   90,       86, 
  'Mitchell',  78,       91)

# Take a look at the data frame
print(prd_samp)

# t-test: paired sample
t.test(prd_samp$test1, prd_samp$test2, paired = TRUE)





#
# Exercise
#

# 1. Complete the following task: https://faculty.washington.edu/chudler/java/ready.html
# 2. Write down your times in condition 1 and condition 2
# 3. Tell me your numbers and wait for instructions

# Copy table here:
stroop_task <- tribble(
  ~'name',     ~'time1', ~'time2', 
  'Mike',            35,       67, 
  'Melanie',         50,       46, 
  'Melissa',         90,       86, 
  'Mitchell',        78,       91)

# Make a plot
stroop_task %>% 
  gather(., condition, time, -name) %>% 
  ggplot(., aes(x = condition, y = time)) + 
    geom_text(aes(label = name)) + 
    stat_summary(fun.data = mean_se, geom = "pointrange", fill = "white", 
                 position = position_nudge(x = 0.2), pch = 21, size = 1.5)


# - What are your observations? Do you think there is a difference between
#   time1 and time2?
# - Conduct a paired samples t-test. 
# - What is the difference between the two means? What is the p-value?












#
# More examples
#


# Create some data
ex_df <- tibble(
  group = c(rep('g1', 3000), rep('g2', 3000)), 
  var   = c(rnorm(n = 3000, mean = -10, sd = 20), 
            rnorm(n = 3000, mean = 10, sd = 20))
)

# Plot the distributions
ggplot(ex_df, aes(var)) + 
  geom_density(aes(lty = group, fill = group), alpha = 0.5) + 
  geom_vline(xintercept = mean(ex_df[ex_df$group == "g1", "var"] %>% pull)) + 
  geom_vline(xintercept = mean(ex_df[ex_df$group == "g2", "var"] %>% pull), lty = 2) + 
  scale_fill_brewer(palette = 'Set1') + 
  theme_bw(base_size = 18, base_family = 'Times')

# Exercise
# - Do an independent samples t-test on the data
# - What is the difference between group means?
# - What is the p-value? What does it mean?



