
#LOLL??POP
library(ggplot2)
library(dplyr)
msleep_new <- msleep %>% filter(!is.na(conservation)) %>%
  count(conservation)

ggplot(msleep_new, aes(x = conservation, y = n)) +
  geom_segment(
    aes(x = conservation, xend = conservation, y = 0, yend = n),
    color = "black"
  ) +
  geom_point(size = 4, color = "skyblue", fill = "black", shape = 21) +
  labs(
    title = "Distribution of Conservation Status",
    x = "Conservation Status",
    y = "Count"
  ) +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))


