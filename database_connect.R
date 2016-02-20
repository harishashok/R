library(DBI)

#Establishing connectivity with MySQL.
con <- dbConnect(RMySQL::MySQL(), 
                 dbname = "dbname", 
                 host = "host_link", 
                 port = 3306,
                 user = "username",
                 password = "password")
                 
# Send query to the database with dbSendQuery(): res
res <- dbSendQuery(con, "SELECT * FROM comments WHERE user_id > 4")

# Display information contained in res
dbGetInfo(res)

# Use dbFetch() twice
dbFetch(res, n = 2)
dbFetch(res)

# Clear res
dbClearResult(res)

##########################

# Create data frame specific
specific <- dbGetQuery(con, "SELECT message FROM comments WHERE tweat_id = 77 and user_id > 4")

# Create data frame short
short <- dbGetQuery(con,"SELECT id,name FROM users WHERE CHAR_LENGTH(name) < 5")

# Print specific and short
specific 
short
