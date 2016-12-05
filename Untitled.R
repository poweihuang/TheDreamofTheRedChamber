library(jiebaR)
setwd("~/R/Rjieba")

wk = worker()
wk <= './RedDream.txt'

library(tm)
mycorpus <- Corpus(DirSource("RedDream.segment.2016-11-27_17_49_03"), list(langue = NA))
tdm <- TermDocumentMatrix(mycorpus, control = list(wordLengths = c(1, Inf)))
inspect(tdm[1:200])
mtr <- as.matrix(tdm)
sortmtr <- sort(rowSums(mtr),decreasing=TRUE)

firstpart <- Corpus(DirSource("part one"), list(langue = NA))
secondpart <- Corpus(DirSource("part two"), list(langue = NA))
tdm1 <- TermDocumentMatrix(firstpart, control = list(wordLengths = c(1, Inf)))
tdm2 <- TermDocumentMatrix(secondpart, control = list(wordLengths = c(1, Inf)))
mtr1 <- as.matrix(tdm1)
mtr2 <- as.matrix(tdm2)
sortmtr1 <- sort(rowSums(mtr1), decreasing=T)
sortmtr2 <- sort(rowSums(mtr2), decreasing=T)

cloud1 <- data.frame(word = names(sortmtr1), freq = sortmtr1)
cloud2 <- data.frame(word = names(sortmtr2), freq = sortmtr2)

#Setting Chinese font on word cloud
par(family=("Heiti TC Light"))
wordcloud(cloud1$word, cloud1$freq, min.freq = 100, random.order = F, ordered.colors = F, 
          colors = rainbow(length(row.names(mtr1))))
wordcloud(cloud2$word, cloud2$freq, min.freq = 100, random.order = F, ordered.colors = F, 
          colors = rainbow(length(row.names(mtr2))))


