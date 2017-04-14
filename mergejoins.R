##Given 2 dataframes
df1 <-  data.frame(CustomerId = c(1:6), Product = c(rep("Toaster", 3), rep("Radio", 3)))
df2 <-  data.frame(CustomerId = c(2, 4, 6), State = c(rep("Alabama", 2), rep("Ohio", 1)))

#using base merge function
#Inner Join
Inner <- merge(df1, df2)

#Left Join
Left <- merge(x = df1, y = df2, by = "CustomerId", all.x = TRUE)

#Right Join
Right <- merge(x = df1, y = df2, by = "CustomerId", all.y = TRUE)
#or 
merge(df1, df2, by.x = "CustomerId", by.y = "CustomerId")[,names(df2)]

#Cross Join
Cross <-  merge(df1, df2, by=NULL)

#Using Dplyr
library(dplyr)

#make sure that CustomerId cols are both type numeric
#they ARE not using the provided code in question and dplyr will complain
df1$CustomerId <- as.numeric(df1$CustomerId)
df2$CustomerId <- as.numeric(df2$CustomerId)

#inner
inner_join(df1, df2)

#left outer
left_join(df1, df2)

#right outer
right_join(df1, df2)

#alternate right outer
left_join(df2, df1)

#full join
full_join(df1, df2)

#Filtering joins: filter out rows in df1, don't modify columns
semi_join(df1, df2) #keep only observations in df1 that match in df2.
anti_join(df1, df2) #drops all observations in df1 that match in df2.

#using data.table
library(data.table)

dt1 = as.data.table(df1)
dt2 = as.data.table(df2)
setkey(dt1, CustomerId)
setkey(dt2, CustomerId)
# right outer join keyed data.tables
dt1[dt2]

setkey(dt1, NULL)
setkey(dt2, NULL)
# right outer join unkeyed data.tables - use `on` argument
dt1[dt2, on = "CustomerId"]

# left outer join - swap dt1 with dt2
dt2[dt1, on = "CustomerId"]

# inner join - use `nomatch` argument
dt1[dt2, nomatch=0L, on = "CustomerId"]

# anti join - use `!` operator
dt1[!dt2, on = "CustomerId"]

# inner join
merge(dt1, dt2, by = "CustomerId")

# full outer join
merge(dt1, dt2, by = "CustomerId", all = TRUE)