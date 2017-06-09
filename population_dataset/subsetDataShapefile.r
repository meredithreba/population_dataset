####################################################################
## Subset population dataset and convert to shapefiles
## March 23, 2017
###################################################################

# install packages
install.packages ("ggplot2")
library(ggplot2)

install.packages(c("rgdal", "sp", "raster"))
library(rgdal)
library(sp)
library(raster)

# set working directory
# change to relevant working directory
setwd('D:/Dropbox/Dropbox (Yale_FES)/publishThesis/20170323_Shapefiles')

# read the joined dataset
alldata <- read.csv("alldata.csv", stringsAsFactors=FALSE, header=TRUE, sep=",")

# look at the data structure
str(alldata)

#view column names
names(alldata)
head(alldata$Latitude)
head(alldata$Longitude)


# subset into time periods
##### 
# Ancient -3700 - 0
cities37000_500 = subset(alldata, alldata$year>=-3700 & alldata$year <= -500)
head(cities37000)
nrow(cities37000) 

# how many unique cities are there during this time period
length(unique(cities37000_500$City))
length(unique(cities37000_500$cityid))


#write to csv
write.csv(cities37000_500, "years3700BCE_500BCE_subset.csv", quote=F)



#####
# Classical -501 - 500
cities501_500 = subset(alldata, alldata$year>=-501 & alldata$year <= 500)
head(cities501_500)
nrow(cities501_500)

# how many unique cities are there during this time period
length(unique(cities501_500$City))
length(unique(cities501_500$cityid))


#write to csv
write.csv(cities501_500, "years501BCE_500CE_subset.csv", quote=F)


#####
# Medieval 501 - 1200
cities501_1200 = subset(alldata, alldata$year>=501 & alldata$year <= 1200)
cities501_1200$OtherName <- gsub(",", "", cities501_1200$OtherName)

head(cities501_1200)
nrow(cities501_1200)

# how many unique cities are there during this time period
length(unique(cities501_1200$City))
length(unique(cities501_1200$cityid))

#write to csv
write.csv(cities501_1200, "years501CE_1200CE_subset.csv", quote=F)


#####
# Early Modern 1201 - 1500
cities1201_1500 = subset(alldata, alldata$year>=1201 & alldata$year <= 1500)
cities1201_1500$OtherName <- gsub(",", "", cities1201_1500$OtherName)
head(cities1201_1500)
nrow(cities1201_1500)

# how many unique cities are there during this time period
length(unique(cities1201_1500$City))
length(unique(cities1201_1500$cityid))


#write to csv
write.csv(cities1201_1500, "years1201CE_1500CE_subset.csv", quote=F)


#####
# Modern 1501 - 1800 
cities1501_1800 = subset(alldata, alldata$year>=1501 & alldata$year <= 1800)
cities1501_1800$OtherName <- gsub(",", "", cities1501_1800$OtherName)
head(cities1501_1800)
nrow(cities1501_1800)

# how many unique cities are there during this time period
length(unique(cities1501_1800$City))
length(unique(cities1501_1800$cityid))


#write to csv
write.csv(cities1501_1800, "years1501CE_1800CE_subset.csv", quote=F)


# Industrial 1801 - 2000
cities1801_2000 = subset(alldata, alldata$year>=1801 & alldata$year <= 2000)
cities1801_2000$OtherName <- gsub(",", "", cities1801_2000$OtherName)
head(cities1801_2000)
nrow(cities1801_2000)

# how many unique cities are there during this time period
length(unique(cities1801_2000$City))
length(unique(cities1801_2000$cityid))


#write to csv
write.csv(cities1801_2000, "years1801CE_2000CE_subset.csv", quote=F)


#############################################################################################
## make shapefiles

# read csv files
# ancient
years3700BCE_500BCE_subset <- read.csv("years3700BCE_500BCE_subset.csv", stringsAsFactors=FALSE, header=TRUE, sep=",")
# making shapefile code snippet
# data.frame
class(years3700BCE_500BCE_subset) 

# whatever the equivalent is in your dataframe
coordinates(years3700BCE_500BCE_subset)<- ~Longitude+Latitude
class(years3700BCE_500BCE_subset)

#write shapefile with projection
proj4string(years3700BCE_500BCE_subset) = CRS("+init=epsg:4326")
writeOGR(years3700BCE_500BCE_subset, "D:/Dropbox/Dropbox (Yale_FES)/publishThesis/20170323_Shapefiles/subsetShapefiles/ancient", "years3700BCE_500BCE_subset", driver = "ESRI Shapefile")



# classical
years501BCE_500CE_subset <- read.csv("years501BCE_500CE_subset.csv", stringsAsFactors=FALSE, header=TRUE, sep=",")
# making shapefile code snippet
# data.frame
class(years501BCE_500CE_subset) 
# whatever the equivalent is in your dataframe
coordinates(years501BCE_500CE_subset)<- ~Longitude+Latitude
class(years501BCE_500CE_subset)

#write shapefile with projection
proj4string(years501BCE_500CE_subset) = CRS("+init=epsg:4326")
writeOGR(years501BCE_500CE_subset, "D:/Dropbox/Dropbox (Yale_FES)/publishThesis/20170323_Shapefiles/subsetShapefiles/classical", "years501BCE_500CE_subset", driver = "ESRI Shapefile")



# medieval
years501CE_1200CE_subset <- read.csv("years501CE_1200CE_subset.csv", stringsAsFactors=FALSE, header=TRUE, sep=",")
# making shapefile code snippet
# data.frame
class(years501CE_1200CE_subset) 
# whatever the equivalent is in your dataframe
coordinates(years501CE_1200CE_subset)<- ~Longitude+Latitude
class(years501CE_1200CE_subset)

#write shapefile with projection
proj4string(years501CE_1200CE_subset) = CRS("+init=epsg:4326")
writeOGR(years501CE_1200CE_subset, "D:/Dropbox/Dropbox (Yale_FES)/publishThesis/20170323_Shapefiles/subsetShapefiles/medieval", "years501CE_1200CE_subset", driver = "ESRI Shapefile")



# early modern
years1201CE_1500CE_subset <- read.csv("years1201CE_1500CE_subset.csv", stringsAsFactors=FALSE, header=TRUE, sep=",")
# making shapefile code snippet
# data.frame
class(years1201CE_1500CE_subset) 
# whatever the equivalent is in your dataframe
coordinates(years1201CE_1500CE_subset)<- ~Longitude+Latitude
class(years1201CE_1500CE_subset)

#write shapefile with projection
proj4string(years1201CE_1500CE_subset) = CRS("+init=epsg:4326")
writeOGR(years1201CE_1500CE_subset, "D:/Dropbox/Dropbox (Yale_FES)/publishThesis/20170323_Shapefiles/subsetShapefiles/early_modern", "years1201CE_1500CE_subset", driver = "ESRI Shapefile")



# modern
years1501CE_1800CE_subset <- read.csv("years1501CE_1800CE_subset.csv", stringsAsFactors=FALSE, header=TRUE, sep=",")
# making shapefile code snippet
# data.frame
class(years1501CE_1800CE_subset) 
# whatever the equivalent is in your dataframe
coordinates(years1501CE_1800CE_subset)<- ~Longitude+Latitude
class(years1501CE_1800CE_subset)

#write shapefile with projection
proj4string(years1501CE_1800CE_subset) = CRS("+init=epsg:4326")
writeOGR(years1501CE_1800CE_subset, "D:/Dropbox/Dropbox (Yale_FES)/publishThesis/20170323_Shapefiles/subsetShapefiles/modern", "years1501CE_1800CE_subset", driver = "ESRI Shapefile")



# industrial
years1801CE_2000CE_subset <- read.csv("years1801CE_2000CE_subset.csv", stringsAsFactors=FALSE, header=TRUE, sep=",")
# making shapefile code snippet
# data.frame
class(years1801CE_2000CE_subset) 
# whatever the equivalent is in your dataframe
coordinates(years1801CE_2000CE_subset)<- ~Longitude+Latitude
class(years1801CE_2000CE_subset)

#write shapefile with projection
proj4string(years1801CE_2000CE_subset) = CRS("+init=epsg:4326")
writeOGR(years1801CE_2000CE_subset, "D:/Dropbox/Dropbox (Yale_FES)/publishThesis/20170323_Shapefiles/subsetShapefiles/industrial", "years1801CE_2000CE_subset", driver = "ESRI Shapefile")




####################################################################
# making shapefile code snippet
# data.frame
class(alldata) 
# whatever the equivalent is in your dataframe
# could also use C(1,2) or relavant column numbers or c("Latitude", "Longitude")
coordinates(alldata)<- ~Longitude+Latitude
class(alldata)

#write shapefile with projection
proj4string(alldata) = CRS("+init=epsg:4326")
writeOGR(alldata, "D:/Dropbox/Dropbox (Yale_FES)/publishThesis/20170323_Shapefiles/subsetShapefiles/dataset_full", "dataset_full", driver = "ESRI Shapefile")

