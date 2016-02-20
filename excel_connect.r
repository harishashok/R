# Load the readxl and gdata package
library(readxl)
library(gdata)

# Specification of url: url_xlsx
url_xls <- "http://s3.amazonaws.com/assets.datacamp.com/course/importing_data_into_r/latitude.xls"

# Import the .xlsx file with gdata: excel_gdata
excel_gdata <- read.xls(url_xls)

# Download file behind URL, name it local_latitude.xls
download.file(url_xls, destfile = "local_latitude.xls")

# Import the local .xlsx file with readxl: excel_readxl
excel_readxl <- read_excel("local_latitude.xls")

####################
# Load the readr package
library(readr)

# Import the csv file: pools
url_csv <- "http://s3.amazonaws.com/assets.datacamp.com/course/importing_data_into_r/swimming_pools.csv"
pools <- read_csv(url_csv)

# Import the txt file: potatoes
url_delim <- "http://s3.amazonaws.com/assets.datacamp.com/course/importing_data_into_r/potatoes.txt"
potatoes <- read_tsv(url_delim)


# Print pools and potatoes
pools
potatoes
