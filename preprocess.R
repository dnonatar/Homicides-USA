#setwd('/home/ratanond/Desktop/IUPUI/INFO-H517/Project2/data')

data=read.csv('/home/ratanond/Desktop/IUPUI/INFO-H517/Project2/SHR76_17.csv')

data_2017 = data[data$Year==2017,]
data_2007 = data[data$Year==2007,]
data_1997 = data[data$Year==1997,]
data_1987 = data[data$Year==1987,]
data_1977 = data[data$Year==1977,]


drops = c("ID","Ori","Agency","Source","StateName","Subcircum","FileDate","fstate","MSA",
          "Agentype","Solved","Incident","ActionType","VicCount","OffCount")
data = data[,!(names(data) %in% drops)]

data_2007 = data_2007[,!(names(data_2007) %in% drops)]
data_1997 = data_1997[,!(names(data_1997) %in% drops)]
data_1987 = data_1987[,!(names(data_1987) %in% drops)]
data_1977 = data_1977[,!(names(data_1977) %in% drops)]

write.csv(data_2007,"/home/ratanond/Desktop/IUPUI/INFO-H517/Project2/Main/data/SHR_2007.csv",row.names = FALSE)
write.csv(data_1997,"/home/ratanond/Desktop/IUPUI/INFO-H517/Project2/Main/data/SHR_1997.csv",row.names = FALSE)
write.csv(data_1987,"/home/ratanond/Desktop/IUPUI/INFO-H517/Project2/Main/data/SHR_1987.csv",row.names = FALSE)
write.csv(data_1977,"/home/ratanond/Desktop/IUPUI/INFO-H517/Project2/Main/data/SHR_1977.csv",row.names = FALSE)

