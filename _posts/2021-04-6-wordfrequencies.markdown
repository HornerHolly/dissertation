---
layout: post
title:  "Word Frequencies"
date:   2021-04-6 12:21:16 -0500
categories: jekyll update
---

# Chapter Aims

For Chapter 1 of my dissertation, I wanted to find a way to understand how William Wordsworth uses sound language across his entire poetic canon. I used the Project Gutenberg eight volume ebook of *The Poetical Works of William Wordsworth* edited by William Knight (1896). Based on the Jacque Atalli's ideas from *Noise*, I suspected that Wordsworth's sound words offer clues regarding the poet's shifting personal and political views across his lifetime.[&#x00b2;](#n1)  To explore this hunch, I used text-mining analysis in RStudio to tabulate the total frequencies of words in Wordsworth's poetry. From there, I manually extracted sound words and classic Romantic metaphors of sound from this list of word frequencies and built what I call the "Sound Spectrum." [&#x00b2;](#n2) This way of sifting through a "bag of words" rather than close-reading over 900 poems allowed for me to cover more content than would otherwise be feasibly possible if I opted to manually comb through all eight volumes of poetry.   


# R Code for Word Frequencies 
See below for the code I used to generate a word frequency table for all of 927 poems: 

```
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
```


# Preliminary Text-Mining Analysis 
Before sifting through for sound words, here are the top 50 words used in Wordsworth's poetic canon:

| Top 50 | Word    | Frequency |
| ------ | ------- | --------- |
| 1      | the     | 4990      |
| 2      | and     | 4294      |
| 3      | to      | 4108      |
| 4      | of      | 4090      |
| 5      | in      | 3570      |
| 6      | that    | 3549      |
| 7      | with    | 3261      |
| 8      | from    | 2990      |
| 9      | for     | 2852      |
| 10     | as      | 2775      |
| 11     | by      | 2645      |
| 12     | on      | 2553      |
| 13     | or      | 2534      |
| 14     | it      | 2496      |
| 15     | not     | 2473      |
| 16     | is      | 2467      |
| 17     | i       | 2459      |
| 18     | but     | 2355      |
| 19     | his     | 2308      |
| 20     | be      | 2214      |
| 21     | this    | 2126      |
| 22     | all     | 2112      |
| 23     | their   | 2034      |
| 24     | was     | 2033      |
| 25     | her     | 1982      |
| 26     | he      | 1976      |
| 27     | are     | 1905      |
| 28     | they    | 1890      |
| 29     | at      | 1853      |
| 30     | when    | 1838      |
| 31     | if      | 1829      |
| 32     | love    | 1774      |
| 33     | my      | 1753      |
| 34     | what    | 1727      |
| 35     | which   | 1717      |
| 36     | who     | 1704      |
| 37     | heart   | 1661      |
| 38     | no      | 1660      |
| 39     | like    | 1652      |
| 40     | she     | 1646      |
| 41     | we      | 1642      |
| 42     | may     | 1622      |
| 43     | thi     | 1617      |
| 44     | have    | 1605      |
| 45     | one     | 1549      |
| 46     | will    | 1510      |
| 47     | him     | 1510      |
| 48     | through | 1498      |
| 49     | nor     | 1497      |
| 50     | while   | 1493      |


For those interested in the entire output of my code, I have included an excel version of my findings on this dissertation's [Github page](https://github.com/HornerHolly/dissertation).

# Next Steps

Although there are still some tweaks needing to be made (namely how RStudio uses stemming), this is a fairly reliable method of creating word frequencies. The next step, however, is to make use of the data, which will be covered in a forthcoming blog post on the "Sound Spectrum." 



# Notes
<span id="n1">&#x00b1; Attali, Jacques. *Noise  : The Political Economy of Music.* Minneapolis: University of Minnesota Press, 1985. 

<span id="n2">&#x00b2; A forth-coming blog entry on the process for creating the Sound Spectrum will cover all theoretical and digital processes.
