CR_Date <- data.frame(
  pos1="2017-11-25 19:04:50.507661",
  pos2=c("2017-11-25 19:04:51.744662")
)

CR_Date$hours <- with(CR_Date, difftime(pos2,pos1,units="secs") )
CR_Date


# Tempos medidos: 

t-connect
t-total
t-requisicao
t-sistema = t-total - t-startTransfer
t-bd = t-total - (t-sistema + t-connect)
