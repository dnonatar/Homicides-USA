setwd('/home/ratanond/Desktop/IUPUI/INFO-H517/Project2/Main/data')

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

#### get victim sex
shr_vic_male = shr[shr$VicSex=='Male',]
shr_vic_female = shr[shr$VicSex=='Female',]
cir_by_month_M = data.frame(table(shr_vic_male$Circumstance,shr_vic_male$Month))
cir_by_month_M = cast(cir_by_month_M,Var1~Var2)

cir_by_month_F = data.frame(table(shr_vic_female$Circumstance,shr_vic_female$Month))
cir_by_month_F = cast(cir_by_month_F,Var1~Var2)

#write.csv(cbind(cir_by_month, cir_by_month_M,cir_by_month_F),"cir_by_month_MF.csv",row.names = FALSE)

####  get victim sex for each state
state_vic = data.frame(table(shr$State,shr$VicSex))
state_vic = cast(state_vic,Var1~Var2)
colnames(state_vic) = c("state","female", "male", "unknown")

write.csv(state_vic,"state_vic.csv",row.names = FALSE)

####  get offender sex for each state
state_off = data.frame(table(shr$State,shr$OffSex))
state_off = cast(state_off,Var1~Var2)
colnames(state_off) = c("state","female", "male", "unknown")

write.csv(state_off,"state_off.csv",row.names = FALSE)

## heatmap data  : weapon vs. relationship
weapon_rela = data.frame(table(shr$Weapon,shr$Relationship))
colnames(weapon_rela) = c("weapon","relationship","deaths")
weapon_rela = weapon_rela[,c("relationship","weapon","deaths")]
weapon_n = as.integer(factor(weapon_rela$weapon))
relationship_n = as.integer(factor(weapon_rela$relationship))
weapon_rela = cbind(weapon_rela,weapon_n,relationship_n)

write.csv(weapon_rela,"weapon_relationship.csv",row.names = FALSE)
