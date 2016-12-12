library(data.table)
library(arules)
library(arulesViz)


mydata<-fread("usersha1-artmbid-artname-plays.tsv")

#since some user may have played certain artist by accident or just browsing
#remove all which have number of plays == 1
mydata<-mydata[mydata$V4>1]

mydata <- lapply(mydata, gsub, pattern = "&", replacement = "and", fixed = TRUE)
mydata <- lapply(mydata, gsub, pattern = "Ã©", replacement = "e", fixed = TRUE)
mydata <- lapply(mydata, gsub, pattern = "Ã–", replacement = "o", fixed = TRUE)
mydata <- lapply(mydata, gsub, pattern = "Å¼", replacement = "Z", fixed = TRUE)


url_pattern <- "(( -)|(((.-\\ +?)www)|((.-+?)www)|((\\ +?)www)|((.\\(+?)www)).*)"

mydata[,3]<-lapply(mydata[,3], gsub, pattern = url_pattern, replacement ='', fixed = FALSE)

#The records are aggregated using the following abstractions :
#each user is considered as a transaction while the groups he listens to are his "basket"
i <- split(mydata$V3, mydata$V1)
#convert the data into transactions
txn <- as(i, "transactions")

#show the top 25 transactions
itemFrequencyPlot(txn, topN = 25)

#run the algorithm 
basket_rules<-apriori(txn,parameter=list(sup=0.01,conf=0.6,target="rules",maxlen=5))

plot(head(basket_rules,by="lift",20), method="grouped")

subrules <- head(sort(basket_rules, by="lift"), 20)

#run again for a larger rules set
basket_rules_broad<-apriori(txn,parameter=list(sup=0.001,conf=0.5,target="rules",maxlen=5))
plot(head(basket_rules_broad,by="lift",20), method="grouped")
#plot(head(basket_rules_broad,by="lift",20), method="grouped")

#inspectDT(head(basket_rules_broad,by="lift"))
beethoven_subset<- subset( basket_rules_broad, subset = lhs %pin% "ludwig van beethoven" ) 
plot(head(beethoven_subset,by="lift",100), method="grouped")


killers_subset<- subset( basket_rules_broad, subset = rhs %pin% "the killers" ) 
plot(head(killers_subset,by="confidence",20), method="graph")
plot(head(killers_subset,by="confidence",20), method="grouped")