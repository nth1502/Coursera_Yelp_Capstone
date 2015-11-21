#Restrain 1
USA <- business[(business$state == "AZ") | (business$state == "NV") |
                    (business$state == "WI") | (business$state == "PA") |
                    (business$state == "PA") | (business$state == "IL") |
                    (business$state == "NC"), ]

#Restrain 2 
id <- USA$business_id[grep("Restaurants|Food|Pubs",USA$categories)]
restDT <- as.data.frame(id)


#Only choose business_id, text and stars from reviews data
text_star <- reviews[,which(names(reviews) %in% 
                                c("business_id", "text", "stars"))]
#Change the column name of business_id to id (for merging below)
names(text_star)[names(text_star) == "business_id"] <- "id"
#Merge both filtered business and review data
Yelp_reviews <- merge(text_star,restDT,by="id")
#Remove unused variables to free memory
rm(text_star)
rm(restDT)
rm(id)
rm(USA)


#Get all positive and negative emoticons from qdap list.
#This process is quite manually extensive
data("emoticon")
emot_pos <- emoticon[c(2,5,13,21,32,33,34,35,37,41,42,46,47,54,66,67,77,78,79),]
emot_neg <- emoticon[c(3,8,11,12,14,15,16,18,25,26,27,28,29,39,45,48,56,59,60,61,62,63,64,65,70,80),]
#Eliminate interpretation column, leaving emoticon only
emot_pos <- emot_pos[,-1]
emot_neg <- emot_neg[,-1]
#Substitute emoticons for word " emotismiley " (for positve) or " emotifrowney " (for negative) in text of reviews
Yelp_reviews$text <- mgsub(as.character(emot_neg),
                           " emotifrowney " , Yelp_reviews$text)
Yelp_reviews$text <- mgsub(as.character(emot_pos),
                           " emotismiley ", Yelp_reviews$text)


#Usual routines to clean up text
Yelp_reviews$text <- str_replace_all(Yelp_reviews$text, "[\n]" , " ")
Yelp_reviews$text <- str_replace_all(Yelp_reviews$text,
                                     "[^[:alnum:][:space:]']", " ")
Yelp_reviews$text <- removeNumbers(Yelp_reviews$text)
Yelp_reviews$text <- toLower(Yelp_reviews$text)
Yelp_reviews$text <- removeWords(Yelp_reviews$text,stopwords("english"))
#Remove multiple white spaces
Yelp_reviews$text <- gsub("(?<=[\\s])\\s*|^\\s+$","", 
                          Yelp_reviews$text, perl=TRUE)
#Remove trailing white space
Yelp_reviews$text <- str_trim(Yelp_reviews$text, side = "both")

#write.table(Yelp_reviews,"Yelp_reviews.txt")
write.csv(Yelp_reviews,"Yelp_reviews_cleaned.csv",row.names = FALSE)