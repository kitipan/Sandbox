library(RODBC)
library(data.table)
library(ggplot2)
library(ggmap)

#Connect to SQL using RODBC, fetch to data.table
dbhandle <- odbcDriverConnect('driver={SQL Server};server=DESKTOP-2UN78L4;database=dbReinsurance;trusted_connection=true')
POL <- data.table(sqlQuery(dbhandle, 'select * from dbo.POL'))
Prov <- data.frame(sqlQuery(dbhandle, 'SELECT distinct City FROM [dbReinsurance].[dbo].[Pol] where City is not null'))

#Convert to character
Prov1 <- data.frame(lapply(Prov, as.character), stringsAsFactors=FALSE)

#Getting Lat,long from Google
Prov2 <- mutate_geocode(Prov1,City)

#Annual Premium by City, could be used to check other things
AnnP <- pol[,.(Annual_Premium = sum(AnnaualP)),by=City]
toplot <- AnnP[Prov2, on = c("City", "City")]

#Plotting on Map
map <- get_map(location = 'Thailand', zoom = 5)
ggmap(map)+ 
  geom_point(aes(x= lon,y = lat, size = Annual_Premium), data = toplot, alpha = .5)+
  ggtitle("Annual Premuim by City")



  