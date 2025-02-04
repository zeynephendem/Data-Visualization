#TREEMAP
install.packages("treemap")
install.packages("dplyr")
library(treemap)
library(dplyr)

# Veri setini y??kle ve incele
data(msleep)
head(msleep)

# Veriyi haz??rlama: vore s??tunundaki kelimelerin s??kl??klar??n?? hesapla
vore_counts <- msleep %>%
  group_by(vore) %>%
  summarise(count = n()) %>%
  na.omit()

# Treemap grafi??i olu??turma
treemap(vore_counts,
        index = "vore",    # Kategorileri 'vore' s??tununa g??re grupla
        vSize = "count",   # Her kutunun b??y??kl??????n?? 'count' ile belirle
        vColor = "count",  # Renkler 'count' de??erine g??re olacak
        draw = TRUE,       # Grafi??i ??iz
        palette = "Set3",  # Renk paleti
        title = "Treemap for Animal Feeding Types")
