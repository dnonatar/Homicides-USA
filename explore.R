setwd('/home/ratanond/Desktop/IUPUI/INFO-H517/Project2/data')

library(reshape)

shr = read.csv('SHR_2017.csv')
attach(shr)

sort(table(State),decreasing = TRUE)[1:20]
sort(table(CNTYFIPS),decreasing = TRUE)[1:10]

## Get deaths for each month by circumstance
cir_by_month = data.frame(table(Circumstance,Month))
cir_by_month = cast(cir_by_month,Circumstance~Month)

write.csv(cir_by_month,"cir_by_month.csv",row.names = FALSE)

## Get total deaths for each state
total_death_state = data.frame(table(shr$State))
colnames(total_death_state) = c("State","Deaths")

#write.csv(total_death_state,"deaths_by_state.csv",row.names = FALSE)

shr_male = shr[shr$VicSex=='Male',]
shr_female = shr[shr$VicSex=='Female',]
cir_by_month_M = data.frame(table(shr_male$Circumstance,shr_male$Month))
cir_by_month_M = cast(cir_by_month_M,Var1~Var2)

cir_by_month_F = data.frame(table(shr_female$Circumstance,shr_female$Month))
cir_by_month_F = cast(cir_by_month_F,Var1~Var2)

write.csv(cbind(cir_by_month, cir_by_month_M,cir_by_month_F),"cir_by_month_MF.csv",row.names = FALSE)
