


# clean working directory
rm(list = ls(all = TRUE))

library(tidyr); library(dplyr); library(ggplot2)



x <- seq(1:30)
g <- gl(n = 2, k = 15, length = 30, labels = c('females', 'males'))
y.iq <- rnorm(n = 30, mean = 80, sd = 18)
y.wt <- rnorm(n = 30, mean = 170, sd = 50)
y.ht <- rnorm(n = 30, mean = 60, sd = 15)

df <- data.frame(subj = x, 
                 group = g, 
                 iq = y.iq, 
                 wt = sort(y.wt), 
                 ht = y.ht)


df %>%
  gather(., key = var, value = value, -subj, -group) %>%
  ggplot(., aes(x = var, y = value, fill = group)) + 
  geom_jitter() +
  geom_boxplot()

df %>%
  ggplot(., aes(x = ht, y = wt)) + 
  geom_point(aes(colour = iq, shape = group)) +
  geom_smooth(method = 'lm', alpha = 0.2, color = 'red', 
              formula = y ~ x, fullrange = T) + 
  ylim(0, 230) + xlim(0, 90) +
  theme_bw()