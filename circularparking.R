#CIRCULARPACKING
# Gerekli k??t??phaneleri y??kle
install.packages("ggplot2")
install.packages("ggforce")
install.packages("dplyr")
library(ggplot2)
library(ggforce)
library(dplyr)

# Veri setini y??kle ve incele
data(msleep)
head(msleep)

# Veriyi haz??rlama: vore s??tunundaki kelimelerin s??kl??klar??n?? hesapla
vore_counts <- msleep %>%
  group_by(vore) %>%
  summarise(count = n()) %>%
  na.omit()

# Circular Packing grafi??i olu??turma
ggplot(vore_counts, aes(x = 0, y = 0, r = sqrt(count), fill = vore)) +
  geom_point(aes(size = count), shape = 21, color = "white") +  # Daireler i??in grafik
  scale_size_continuous(range = c(5, 25)) +  # Daire boyutlar??n?? ayarl??yoruz
  scale_fill_brewer(palette = "Set3") +  # Renk paletini belirliyoruz
  theme_void() +  # Temay?? bo?? b??rak??yoruz
  ggtitle("Circular Packing for Animal Feeding Types")  # Ba??l??k ekliyoruz
