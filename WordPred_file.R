#Word Predictor file
library(dplyr)
library(data.table)
library(qdap)
library(ngram)
library(tm)
library(RWeka)
library(stringr)
library(stringi)
library(NLP)
library(wordcloud)
library(ggplot2)
#setwd("C:/Users/tljon/datasciencecoursera/FinalProject")

load("unigram.Rda")
load("bigram.Rda")
load("trigram.Rda")
load("quadgram.Rda")

wordpred <- function(sentence){
    value = "push the submit button"
    sen = unlist(strsplit(sentence,' '))
    if(length(sen)>=3){value = quadgram(sen[(length(sen)-2):length(sen)])
    }
    if(is.null(value)||length(sen)==2){
        value = trigram(sen[(length(sen)-1):length(sen)])
    }
    if(is.null(value)||length(sen)==1){value = bigram(sen[length(sen)])
    }
    if(is.null(value)){value = "the"} #default value
    
    return(value)
}

quadgram <- function(fourg){
    four <- paste(fourg,collapse = ' ')
    foursum <- data.frame(quadgram="test",frequency=0)
    l <- t_list[trigram==four]
    m <- as.numeric(l$frequency)
    if(length(m)==0) return(NULL)
    
    for(string0 in unigramlist$unigram){
        text = paste(four,string0)
        found <- q_list[quadgram==text]
        n<- as.numeric(found$frequency)
        
        if(length(n)!=0){
            foursum <- rbind(foursum,found)
            
        }
    }
    if(nrow(foursum)==1) return(NULL)
    foursum <- foursum[order(-frequency)]
    sen <- unlist(strsplit(as.String(foursum[1,fourgram]),' '))
    return (sen[length(sen)])
}

trigram <- function(threeg){
    three <- paste(threeg,collapse = ' ')
    threesum <- data.frame(trigram="test",frequency=0)
    l <- b_list[bigram==three]
    m <- as.numeric(l$frequency)
    if(length(m)==0) return(NULL)
    
    for(string0 in u_list$unigram){
        text = paste(three,string0)
        found <- t_list[trigram==text]
        n<- as.numeric(found$frequency)
        
        if(length(n)!=0){
            threesum <- rbind(threesum,found)
        }
    }
    if(nrow(threesum)==1) return(NULL)
    threesum <- threesum[order(-frequency)]
    sen <- unlist(strsplit(as.String(threesum[1,trigram]),' '))
    return (sen[length(sen)])
}

bigram <- function(twog){
    two <- paste(twog,collapse = ' ')
    twosum <- data.frame(bigram="test",frequency=0)
    l <- u_list[unigram==two]
    m <- as.numeric(l$frequency)
    if(length(m)==0) return(NULL)
    
    for(string0 in u_list$unigram){
        text = paste(two,string0)
        found <- b_list[bigram==text]
        n<- as.numeric(found$frequency)
        
        if(length(n)!=0){
            twosum <- rbind(twosum,found)
        }
    }
    
    if(nrow(twosum)==1) return(NULL)
    twosum <- twosum[order(-frequency)]
    
    sen <- unlist(strsplit(as.String(twosum[1,bigram]),' '))
    return (sen[length(sen)])
}

