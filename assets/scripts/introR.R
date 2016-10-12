


# clean working directory
rm(list = ls(all = TRUE))

library(tidyr); library(dplyr); library(ggplot2)

n <- 100
height <- round(rnorm(n = n, mean = 65, sd = 7), 1)
weight <- height + n * 1.05
s <- -3 + 2 * height + rnorm(n)
catVar <- rbinom(n, size = 1, prob = exp(s) / (1 + exp(s)))
df <- data.frame(height, weight, catVar)

50 5 1 0.075
y = beta0 + x * beta1 + rnorm(n, sd = sigma)

glimpse(df)

df %>%
  ggplot(., aes(x = height, y = catVar)) + 
  ylim(0, 1) + 
  geom_smooth(method = "glm", method.args=list(family="binomial"), se = T)

df %>%
  ggplot(., aes(x = height, y = weight)) + 
  geom_point()

df %>%
  lm(height ~ conVar2, data = .) %>%
  summary




x <- seq(1:30)
g <- gl(n = 2, k = 15, length = 30, labels = c('females', 'males'))
y.iq <- rnorm(n = 30, mean = 80, sd = 18)
y.wt <- rnorm(n = 30, mean = 170, sd = 50)
y.ht <- rnorm(n = 30, mean = 60, sd = 15)

df <- data.frame(subj = x, 
                 group = g, 
                 y.iq = y.iq, 
                 y.wt = sort(y.wt), 
                 y.ht = y.ht)

library(tidyr); library(dplyr); library(ggplot2)

df %>%
  gather(., key = var, value = value, -subj, -group) %>%
  ggplot(., aes(x = var, y = value, fill = group)) + 
  geom_jitter() +
  geom_boxplot()

df %>%
  ggplot(., aes(x = y.ht, y = y.wt)) + 
  geom_point(aes(colour = y.iq, shape = group)) +
  geom_smooth(method = 'lm', alpha = 0.2, color = 'red', 
              formula = y ~ x, fullrange = T) + 
  ylim(0, 230) + xlim(0, 90) +
  theme_bw()