setwd("C:/Users/onycom/Desktop/DataAnalysis/adp/4장.비정형텍스트마이닝")

library(tm)
library(KoNLP)
library(wordcloud)

getwd()
moon.text = readLines("president_moon.txt" , encoding= "UTF-8")

head(moon.text)

moon  = paste(moon.text, collapse = ' ')
moon


tran = Map(extractNoun, moon)
tran = unique(tran)
tran


tran = sapply(tran, function(x) {
  Filter(function(y){
    nchar(y) <= 4 && nchar(y) > 1 && is.hangul(y)
  },x)
})

tran.table = as.data.frame(table(tran))

head(tran.table,3)

wordcloud(words = tran.table$tran, freq = tran.table$Freq, min.freq = 3, random.order = F,
          colors = brewer.pal(5,'Dark2'))
