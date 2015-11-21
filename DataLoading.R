#Task 0 Get data and explore
#Setting working directory and packages used in analysis
setwd("C:/Users/Hieu/Documents/GitHub/Yelp_Capstone")
library(jsonlite)
library(tm)
library(stringr)
library(qdap)
library(quanteda)

#Processs JSON type data
file_business <- file("./data/yelp_academic_dataset_business.json")
business <- stream_in(file_business)

file_review <- file("./data/yelp_academic_dataset_review.json")
reviews <- stream_in(file_review)

#Save loading dataset
saveRDS(business, "business.rds")
saveRDS(reviews, "reviews.rds")

