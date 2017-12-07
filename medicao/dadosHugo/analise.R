library(ggplot2)

times_reqB %>%
  group_by(numUsers) %>%
  ggplot(aes(x = sizeData, y = tempo, color = as.factor(numUsers))) + 
  geom_boxplot() + 
  geom_jitter(width = .1, size = 1, alpha = .5)


timesB_all %>%
  ggplot(aes(x = sizeData, y = tempo, color = as.factor(numUsers))) + 
  geom_boxplot() + 
  geom_jitter(width = .1, size = 1, alpha = .5)

library(ggplot2)


p <- times_reqB %>%
  ggplot(aes(x = as.character(numUsers), 
             y = tempo, fill = as.character(sizeData))) + 
  geom_boxplot() + 
  geom_jitter(width = .1, size = 1, alpha = .5) + 
  labs(title = "Medição Rede B", 
       x= "Número de Usuários", 
       y= "Tempo", fill = "Número de Turmas")

p
ylim1 = boxplot.stats(times_reqB$tempo)$stats[c(1, 5)] 

p1 = p + coord_cartesian(ylim = ylim1)
p1
