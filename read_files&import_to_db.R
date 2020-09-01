library(readr)
# all filenames in the folder 
files <- list.files('stock_hot/' , pattern = '.csv' )
# read all files as dataframe and combine to a list
tables <- lapply(paste("stock_hot",files,sep="/"),read_csv)
# rename table names of the list
newname <- gsub('.csv', '', files)
newname <- paste0('stock',newname)
names(tables) <- newname

# connect to mariadb, use database "stock"
library(RMariaDB)
library(DBI)
drv <- dbDriver("MariaDB")
con <- dbConnect(drv, username="root", password="", dbname ="stock", host="localhost")

# import tables to database
mapply(dbWriteTable, name = newname, value = tables , MoreArgs = list(conn = con))

# 將查詢結果轉成dataframe
rs <- dbSendQuery(con, "SELECT * FROM stock20207;")
temp <- dbFetch(rs)
# 清除查詢結果
dbClearResult(rs)

# 直接將查詢結果變成dataframe
rs <- dbGetQuery(con, "SELECT * FROM stock20207;")

dbDisconnect(con)
