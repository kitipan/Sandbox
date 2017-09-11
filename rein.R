library(RODBC)
library(data.table)
library(ggplot2)

#Connect to SQL using RODBC, fetch to data.table
dbhandle <- odbcDriverConnect('driver={SQL Server};server=DESKTOP-5RUE27S;database=dbReinsurance;trusted_connection=true')
res <- data.table(sqlQuery(dbhandle, 'select * from dbo.STEP3_COMBINED_EB_DATA'))

#Average Age by Broker and GRoup Policy
res[,mean(Attained_Age),by=.(T5_Broker,GroupPolicy_No)]
res[,sum(Premium),by=.(GroupPolicy_No)]

#Change -999 age to NA
res[Attained_Age==-999,Attained_Age:=NA]

#Boxplot
ggplot(res, aes(GroupPolicy_No, Attained_Age))+geom_boxplot()

#Verify if this is correct
res[GroupPolicy_No=="E000107"]
