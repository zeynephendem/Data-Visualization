#DOUGHNUT
library(wordcloud)
library(dplyr)
library(RColorBrewer)
library(ggplot2)

vore_counts <- msleep %>%
  group_by(vore) %>%
  summarise(count = n()) %>%
  na.omit()

# Y??zde hesaplama
vore_counts <- vore_counts %>%
  mutate(percentage = count / sum(count) * 100)

# Doughnut grafi??i olu??turma
ggplot(vore_counts, aes(x = "", y = percentage, fill = vore)) +
  geom_bar(stat = "identity", width = 1) +  # Pasta grafi??i ??iz
  coord_polar(theta = "y") +  # Polar koordinatlar kullanarak pasta ??eklini elde et
  theme_void() +  # Grafik i??in bo?? tema
  theme(legend.position = "right") +  # Legend'?? sa??a koy
  scale_fill_brewer(palette = "Set3") +  # Renk paleti
  ggtitle("Doughnut Chart for Animal Feeding Types")   # Merkez bo?? b??rakmak i??in
