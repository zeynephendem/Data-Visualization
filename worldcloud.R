#WORLDCLOUD
install.packages("wordcloud")
install.packages("dplyr")
install.packages("RColorBrewer")  # RColorBrewer'?? y??kleyelim, renk paletini kullanabilmek i??in
wlibrary(wordcloud)
library(dplyr)
library(RColorBrewer)

# Veriyi haz??rlama: vore s??tunundaki kelimelerin s??kl??klar??n?? hesapla
vore_counts <- msleep %>%
  group_by(vore) %>%
  summarise(count = n()) %>%
  na.omit()

# Wordcloud grafi??i olu??turma
wordcloud(words = vore_counts$vore,   # Kelimeler
          freq = vore_counts$count,   # S??kl??k
          min.freq = 1,               # Minimum s??kl??k
          scale = c(3, 0.5),          # Kelime boyutu aral??????
          colors = brewer.pal(8, "Dark2"),  # Renk paleti
          random.order = FALSE)       # Rastgele s??ralama yerine s??kl????a g??re s??ralama

# Ba??l??k ekleyelim
title(main = "Wordcloud of Animal Feeding Types")
