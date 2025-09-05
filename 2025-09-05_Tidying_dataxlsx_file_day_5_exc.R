#----Script Header-------------------------####
# Date: 2025-09-05         
# Author: Ingrid Holm    
# Filename: 2025-09-05_Tidying_dataxlsx_file_day_5_exc   
# Description: Hands on task in lecture, day 5
# 
#               
# Project: RMED901 Cource 
#-------------------------------------------###

# Set up ----
## Reading xlsx files ----
library(readxl)
library(here)
library(tidyverse)

data <- read_xlsx(here("Datasett","Dag 5", "datafile.xlsx"))

glimpse(data)

#Point: not a good dataset to work with in R as now 

data <- readxl::read_xlsx(here("Datasett","Dag 5", "datafile.xlsx"),skip = 1)
data


library(readxl)

?readxl

#Problem: collum 3 is dates, however its read as doubble 
#We can define what the different collums contains when reading it 

data <- readxl::read_xlsx(
  here("Datasett","Dag 5", "datafile.xlsx"), 
  skip = 1, 
  col_types = c("numeric", "date", "date", "date", "numeric", "date", "date",
                "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric",
                "numeric", "numeric",  "numeric", "numeric", "text", "text")
)
data

str(data)

## Reading second part of dataset ----
#This dataset is in two sheets, we have only read the first sheet 

data_rest <- readxl::read_xlsx(
  here("Datasett","Dag 5", "datafile.xlsx"), 
  skip = 1, 
  sheet = 2,
  col_types = c("numeric", "date", "date", "date", "numeric", "date", "date",
                "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric",
                "numeric", "numeric",  "numeric", "numeric", "text", "text")
)
data_rest

# Exploring and tidying data ----
#Check if data and data_rest have rows containing the same IDs

sum(data$ID %in% data_rest$ID) 

data %>% count(ID, sort = TRUE)
data %>% filter(is.na(ID))

data %>% filter(is.na(ID))
data_rest %>% filter(is.na(ID))

#What this says: there are 41 NAs in data and 60 NAs in data_rest
#This tells us that probably there is some issues in how the excel-sheets are
#set up giving RStudio problems reading it, or, it is simply a bad dataset 
#with even missing data in IDs 


