setwd('/home/ratanond/Desktop/IUPUI/INFO-H517/Project2/data')

data=read.csv('SHR76_17.csv')

data = data[data$Year>=2016,]

drops = c("ID","Ori","Agency","Source","StateName","Subcircum","FileDate","fstate","MSA",
          "Agentype","Solved","Incident","ActionType","VicCount","OffCount")
data = data[,!(names(data) %in% drops)]

write.csv(data,"SHR_new.csv",row.names = FALSE)
