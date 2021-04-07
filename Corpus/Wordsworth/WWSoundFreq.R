#Test

rm(list=ls())
library(tm)
library(SnowballC)
setwd("E:/R Codes for School/Dissertation/Wordsworth Word Frequencies")


#LOOP TO ITERATE THROUGH ALL OF THE POEMS
#SETTING UP THE LOOP
path = "E:/R Codes for School/Dissertation/Wordsworth Word Frequencies"
file.names <- dir(path, pattern =".txt")
AA_Master <- setNames(data.frame(matrix(ncol = 2, nrow = 0)), c("V1", "V2"))



#FOR LOOP
for(i in 1:length(file.names)){
  file<-scan(file.names[i], "character", sep="\n")
  file<- stemDocument(file)
  file<-tolower(file)
  file<-gsub("[[:punct:]]","",file)
  file<-gsub("â???T","",file)
  #Split sentence
  words<-strsplit(file," ")
  words <- unlist(words)
  
  
  #Calculate word frequencies
  words.freq<-table(words)
  file<-cbind(names(words.freq),as.integer(words.freq))
  
  #drop file name
  file<-file[-1,]
  AA_Master <- merge(x = AA_Master, y = file, by = "V1", all = TRUE)
  assign(file.names[i], file)
}

#Cleaning Merged Data
AAAMaster <- AA_Master[,-1]
AAAMaster[] <- lapply(AAAMaster, as.numeric)
AAAMaster[is.na(AAAMaster)] <- 0
AA_Master$"Total" <- rowSums(AAAMaster[1:928], na.rm=TRUE)
AAA_ALL<- AA_Master[-c(2:929)]
colnames(AAA_ALL)<-c("Word", "Frequency")

remove(AA_Master)
remove(AAAMaster)

#stopwords
##
b<-1
for(b in 1:length(AAA_ALL)){
  AAA_ALL2 <- data.frame(AAA_ALL[!grepl(stopwords("en")[b],AAA_ALL[,1]),])
}

#Calculate word frequencies
#words.freq2<-table(AAA_ALL2)
#file<-cbind(names(words.freq2),as.integer(words.freq2))

#Save progress
write.csv(AAA_ALL,'AAA_ALL.csv')
