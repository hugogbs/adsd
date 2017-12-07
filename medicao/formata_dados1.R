library(tidyverse)

reqB_10t_1u <- read.csv("reqB-10t-1u.txt", header = FALSE)
names(reqB_10t_1u) <- c("time", "flag", "id")
reqB_10t_1u$numUsers <- 1

reqB_10t_10u <- read.csv("reqB-10t-10u.txt", header = FALSE)
names(reqB_10t_10u) <- c("time", "flag", "id")
reqB_10t_10u$numUsers <- 10


reqB_10t_25u <- read.csv("reqB-10t-25u.txt", header = FALSE)
names(reqB_10t_25u) <- c("time", "flag", "id")
reqB_10t_25u$numUsers <- 25

reqB_10t_1u.diff <- data.frame(
  (reqB_10t_1u %>% filter(flag == "inicio ")),
  (reqB_10t_1u %>% filter(flag == " fim"))
)
reqB_10t_1u.diff<- reqB_10t_1u.diff %>%
  mutate(inicio = as.numeric(substr(time,7,15))) %>%
  mutate(fim = as.numeric(substr(time.1,7,15))) %>%
  mutate(tempo = fim - inicio) %>%
  select(tempo) %>%
  mutate(numUsers = 1)







reqB_10t_10u.diff <- data.frame(
  (reqB_10t_10u %>% filter(flag == "inicio ")),
  (reqB_10t_10u %>% filter(flag == " fim"))
)
reqB_10t_10u.diff<- reqB_10t_10u.diff %>%
  mutate(inicio = as.numeric(substr(time,7,15))) %>%
  mutate(fim = as.numeric(substr(time.1,7,15))) %>%
  mutate(tempo = fim - inicio) %>%
  select(tempo) %>%
  mutate(numUsers = 10)

reqB_10t_25u.diff <- data.frame(
  (reqB_10t_25u %>% filter(flag == "inicio ")),
  (reqB_10t_25u %>% filter(flag == " fim"))
)
reqB_10t_25u.diff<- reqB_10t_25u.diff %>%
  mutate(inicio = as.numeric(substr(time,7,15))) %>%
  mutate(fim = as.numeric(substr(time.1,7,15))) %>%
  mutate(tempo = fim - inicio) %>%
  select(tempo) %>%
  mutate(numUsers = 25)

times_reqB_10t <- rbind(reqB_10t_10u.diff,reqB_10t_25u.diff, reqB_10t_1u.diff) %>%
  mutate(sizeData = 10) %>%
  mutate(rede = "B")


timeB_10t_1u <- cbind(timesB_10t_1u, reqB_10t_1u.diff)
timeB_10t_10u <- cbind(timesB_10t_10u, reqB_10t_10u.diff)
timeB_10t_25u <- cbind(timesB_10t_25u, reqB_10t_25u.diff)

####################################################################

reqB_10t_1u <- read.csv("reqB-50t-1u.txt", header = FALSE)
names(reqB_10t_1u) <- c("time", "flag", "id")
reqB_10t_1u$numUsers <- 1

reqB_10t_10u <- read.csv("reqB-50t-10u.txt", header = FALSE)
names(reqB_10t_10u) <- c("time", "flag", "id")
reqB_10t_10u$numUsers <- 10


reqB_10t_25u <- read.csv("reqB-50t-25u.txt", header = FALSE)
names(reqB_10t_25u) <- c("time", "flag", "id")
reqB_10t_25u$numUsers <- 25


reqB_10t_1u.diff <- data.frame(
  (reqB_10t_1u %>% filter(flag == "inicio ")),
  (reqB_10t_1u %>% filter(flag == " fim"))
)
reqB_10t_1u.diff<- reqB_10t_1u.diff %>%
  mutate(inicio = as.numeric(substr(time,7,15))) %>%
  mutate(fim = as.numeric(substr(time.1,7,15))) %>%
  mutate(tempo = fim - inicio) %>%
  select(tempo) %>%
  mutate(numUsers = 1)

reqB_10t_10u.diff <- data.frame(
  (reqB_10t_10u %>% filter(flag == "inicio ")),
  (reqB_10t_10u %>% filter(flag == " fim"))
)
reqB_10t_10u.diff<- reqB_10t_10u.diff %>%
  mutate(inicio = as.numeric(substr(time,7,15))) %>%
  mutate(fim = as.numeric(substr(time.1,7,15))) %>%
  mutate(tempo = fim - inicio) %>%
  select(tempo) %>%
  mutate(numUsers = 10)

reqB_10t_25u.diff <- data.frame(
  (reqB_10t_25u %>% filter(flag == "inicio ")),
  (reqB_10t_25u %>% filter(flag == " fim"))
)
reqB_10t_25u.diff<- reqB_10t_25u.diff %>%
  mutate(inicio = as.numeric(substr(time,7,15))) %>%
  mutate(fim = as.numeric(substr(time.1,7,15))) %>%
  mutate(tempo = fim - inicio) %>%
  select(tempo) %>%
  mutate(numUsers = 25)

times_reqB_50t <- rbind(reqB_10t_10u.diff,reqB_10t_25u.diff, reqB_10t_1u.diff) %>%
  mutate(sizeData = 50) %>%
  mutate(rede = "B")


timeB_50t_1u <- cbind(timesB_50t_1u, reqB_10t_1u.diff)
timeB_50t_10u <- cbind(timesB_50t_10u, reqB_10t_10u.diff)
timeB_50t_25u <- cbind(timesB_50t_25u, reqB_10t_25u.diff)

####################################################################


reqB_10t_1u <- read.csv("reqB-100t-1u.txt", header = FALSE)
names(reqB_10t_1u) <- c("time", "flag", "id")
reqB_10t_1u$numUsers <- 1

reqB_10t_10u <- read.csv("reqB-100t-10u.txt", header = FALSE)
names(reqB_10t_10u) <- c("time", "flag", "id")
reqB_10t_10u$numUsers <- 10


reqB_10t_25u <- read.csv("reqB-100t-25u.txt", header = FALSE)
names(reqB_10t_25u) <- c("time", "flag", "id")
reqB_10t_25u$numUsers <- 25


reqB_10t_1u.diff <- data.frame(
  (reqB_10t_1u %>% filter(flag == "inicio ")),
  (reqB_10t_1u %>% filter(flag == " fim"))
)
reqB_10t_1u.diff<- reqB_10t_1u.diff %>%
  mutate(inicio = as.numeric(substr(time,7,15))) %>%
  mutate(fim = as.numeric(substr(time.1,7,15))) %>%
  mutate(tempo = fim - inicio) %>%
  select(tempo) %>%
  mutate(numUsers = 1)

reqB_10t_10u.diff <- data.frame(
  (reqB_10t_10u %>% filter(flag == "inicio ")),
  (reqB_10t_10u %>% filter(flag == " fim"))
)
reqB_10t_10u.diff<- reqB_10t_10u.diff %>%
  mutate(inicio = as.numeric(substr(time,7,15))) %>%
  mutate(fim = as.numeric(substr(time.1,7,15))) %>%
  mutate(tempo = fim - inicio) %>%
  select(tempo) %>%
  mutate(numUsers = 10)

reqB_10t_25u.diff <- data.frame(
  (reqB_10t_25u %>% filter(flag == "inicio ")),
  (reqB_10t_25u %>% filter(flag == " fim"))
)
reqB_10t_25u.diff<- reqB_10t_25u.diff %>%
  mutate(inicio = as.numeric(substr(time,7,15))) %>%
  mutate(fim = as.numeric(substr(time.1,7,15))) %>%
  mutate(tempo = fim - inicio) %>%
  select(tempo) %>%
  mutate(numUsers = 25)

times_reqB_100t <- rbind(reqB_10t_10u.diff,reqB_10t_25u.diff, reqB_10t_1u.diff) %>%
  mutate(sizeData = 100) %>%
  mutate(rede = "B")


timeB_100t_1u <- cbind(timesB_100t_1u, reqB_10t_1u.diff)
timeB_100t_10u <- cbind(timesB_100t_10u, reqB_10t_10u.diff)
timeB_100t_25u <- cbind(timesB_100t_25u, reqB_10t_25u.diff)

####################################################################

times_reqB <- rbind(times_reqB_100t, times_reqB_10t, times_reqB_50t)


timesB_all <- rbind(timeB_100t_10u, timeB_100t_1u, timeB_100t_25u,
                    timeB_10t_10u, timeB_10t_1u, timeB_10t_25u,
                    timeB_50t_10u, timeB_50t_1u, timeB_50t_25u)

timesB_all$numUsers <- NULL

timesB_all <-  timesB_all %>%
  mutate(timeBD = (tempo + time_connect) - time_total)
