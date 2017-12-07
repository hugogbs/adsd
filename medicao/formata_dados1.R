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
  mutate(numUsers = 25)

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
  mutate(rede = "A")

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
  mutate(numUsers = 25)

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
  mutate(rede = "A")

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
  mutate(numUsers = 25)

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
  mutate(rede = "A")

####################################################################

times_reqB <- rbind(times_reqB_100t, times_reqB_10t, times_reqB_50t)
