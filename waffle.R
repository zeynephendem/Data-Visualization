#Waffle
install.packages("waffle")
install.packages("dplyr")
library(waffle)
library(dplyr)

msleep_summary <- msleep %>%
  group_by(conservation) %>%
  summarise(count = n()) %>%
  na.omit()

# Waffle grafi??i olu??turma
waffle(msleep_summary$count, 
       rows = 5,  # Ka?? sat??rda g??rselle??tirece??imizi belirliyoruz
       colors = c("red", "green", "blue", "yellow", "orange", "purple"),  # 6 renk sa??lad??k
       title = "Waffle Chart for Conservation Status of Animals",
       xlab = "Conservation Status")
