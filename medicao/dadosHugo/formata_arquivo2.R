library(tidyverse)

timesB_100t_1u <- read.csv("timesB-100t-1u.txt", sep = "-", header = FALSE)
names(timesB_100t_1u) <- c("time_connect", "time_starttransfer", "time_total")

timesB_100t_1u <- timesB_100t_1u %>%
  mutate(time_connect = as.numeric(sub(",", ".", time_connect, fixed = TRUE))) %>%
  mutate(time_starttransfer = as.numeric(sub(",", ".", time_starttransfer, fixed = TRUE))) %>%
  mutate(time_total = as.numeric(sub(",", ".", time_total, fixed = TRUE))) %>%
  mutate(sizeData = 100) %>%
  mutate(rede = "B") %>%
  mutate(numUsers = 1)

timesB_100t_10u <- read.csv("timesB-100t-10u.txt", sep = "-", header = FALSE)
names(timesB_100t_10u) <- c("time_connect", "time_starttransfer", "time_total")

timesB_100t_10u <- timesB_100t_10u %>%
  mutate(time_connect = as.numeric(sub(",", ".", time_connect, fixed = TRUE))) %>%
  mutate(time_starttransfer = as.numeric(sub(",", ".", time_starttransfer, fixed = TRUE))) %>%
  mutate(time_total = as.numeric(sub(",", ".", time_total, fixed = TRUE))) %>%
  mutate(sizeData = 10) %>%
  mutate(rede = "B") %>%
  mutate(numUsers = 1)

timesB_100t_25u <- read.csv("timesB-100t-25u.txt", sep = "-", header = FALSE)
names(timesB_100t_25u) <- c("time_connect", "time_starttransfer", "time_total")

timesB_100t_25u <- timesB_100t_25u %>%
  mutate(time_connect = as.numeric(sub(",", ".", time_connect, fixed = TRUE))) %>%
  mutate(time_starttransfer = as.numeric(sub(",", ".", time_starttransfer, fixed = TRUE))) %>%
  mutate(time_total = as.numeric(sub(",", ".", time_total, fixed = TRUE))) %>%
  mutate(sizeData = 100) %>%
  mutate(rede = "B") %>%
  mutate(numUsers = 1)



timesB_10t_1u <- read.csv("timesB-10t-1u.txt", sep = "-", header = FALSE)
names(timesB_10t_1u) <- c("time_connect", "time_starttransfer", "time_total")

timesB_10t_1u <- timesB_10t_1u %>%
  mutate(time_connect = as.numeric(sub(",", ".", time_connect, fixed = TRUE))) %>%
  mutate(time_starttransfer = as.numeric(sub(",", ".", time_starttransfer, fixed = TRUE))) %>%
  mutate(time_total = as.numeric(sub(",", ".", time_total, fixed = TRUE))) %>%
  mutate(sizeData = 100) %>%
  mutate(rede = "B") %>%
  mutate(numUsers = 1)

timesB_10t_10u <- read.csv("timesB-10t-10u.txt", sep = "-", header = FALSE)
names(timesB_10t_10u) <- c("time_connect", "time_starttransfer", "time_total")

timesB_10t_10u <- timesB_10t_10u %>%
  mutate(time_connect = as.numeric(sub(",", ".", time_connect, fixed = TRUE))) %>%
  mutate(time_starttransfer = as.numeric(sub(",", ".", time_starttransfer, fixed = TRUE))) %>%
  mutate(time_total = as.numeric(sub(",", ".", time_total, fixed = TRUE))) %>%
  mutate(sizeData = 100) %>%
  mutate(rede = "B") %>%
  mutate(numUsers = 1)

timesB_10t_25u <- read.csv("timesB-10t-25u.txt", sep = "-", header = FALSE)
names(timesB_10t_25u) <- c("time_connect", "time_starttransfer", "time_total")

timesB_10t_25u <- timesB_10t_25u %>%
  mutate(time_connect = as.numeric(sub(",", ".", time_connect, fixed = TRUE))) %>%
  mutate(time_starttransfer = as.numeric(sub(",", ".", time_starttransfer, fixed = TRUE))) %>%
  mutate(time_total = as.numeric(sub(",", ".", time_total, fixed = TRUE))) %>%
  mutate(sizeData = 100) %>%
  mutate(rede = "B") %>%
  mutate(numUsers = 1)


timesB_50t_10u <- read.csv("timesB-50t-10u.txt", sep = "-", header = FALSE)
names(timesB_50t_10u) <- c("time_connect", "time_starttransfer", "time_total")

timesB_50t_10u <- timesB_50t_10u %>%
  mutate(time_connect = as.numeric(sub(",", ".", time_connect, fixed = TRUE))) %>%
  mutate(time_starttransfer = as.numeric(sub(",", ".", time_starttransfer, fixed = TRUE))) %>%
  mutate(time_total = as.numeric(sub(",", ".", time_total, fixed = TRUE))) %>%
  mutate(sizeData = 100) %>%
  mutate(rede = "B") %>%
  mutate(numUsers = 1)

timesB_50t_25u <- read.csv("timesB-50t-25u.txt", sep = "-", header = FALSE)
names(timesB_50t_25u) <- c("time_connect", "time_starttransfer", "time_total")

timesB_50t_25u <- timesB_50t_25u %>%
  mutate(time_connect = as.numeric(sub(",", ".", time_connect, fixed = TRUE))) %>%
  mutate(time_starttransfer = as.numeric(sub(",", ".", time_starttransfer, fixed = TRUE))) %>%
  mutate(time_total = as.numeric(sub(",", ".", time_total, fixed = TRUE))) %>%
  mutate(sizeData = 100) %>%
  mutate(rede = "B") %>%
  mutate(numUsers = 1)


timesB <- rbind(timesB_100t_10u, timesB_100t_1u, timesB_100t_25u,
                timesB_10t_10u, timesB_10t_1u, timesB_10t_25u,
                timesB_50t_10u, timesB_50t_1u, timesB_50t_25u) 



library(ggplot2)

times_reqB %>%
  group_by(numUsers) %>%
  ggplot(aes(x = sizeData, y = tempo, color = as.factor(numUsers))) + 
           geom_boxplot() + 
           geom_jitter(width = .1, size = 1, alpha = .5)
         
         