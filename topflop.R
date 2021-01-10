#import
library(tidyverse)


#MULTINATIONALES
mult_raw <- read_csv("https://raw.githubusercontent.com/awp-finanznachrichten/lena_november2020/main/Output/Konzernverantwortung_dw.csv")

mult_top <- mult_raw %>%
  arrange(desc(Ja_Stimmen_In_Prozent)) %>%
  slice(1:50) %>%
  select(4,2) %>%
  rename(Commune = Gemeinde_KT_f,
         "Pourcentage de oui" = Ja_Stimmen_In_Prozent)

write.csv(mult_top,"mult_top.csv")

mult_flop <- mult_raw %>%
  arrange((Ja_Stimmen_In_Prozent)) %>%
  mutate("Pourcentage de non" = 100-Ja_Stimmen_In_Prozent) %>%
  slice(1:50) %>%
  select(4,7) %>%
  rename(Commune = Gemeinde_KT_f)

write.csv(mult_flop,"mult_flop.csv")


#VOTE COMMERCE DE GUERRE
guer_raw <-  read_csv("https://raw.githubusercontent.com/awp-finanznachrichten/lena_november2020/main/Output/Kriegsgeschaefte_dw.csv")

guer_top <- guer_raw %>%
  arrange(desc(Ja_Stimmen_In_Prozent)) %>%
  slice(1:50) %>%
  select(4,2) %>%
  rename(Commune = Gemeinde_KT_f,
         "Pourcentage de oui" = Ja_Stimmen_In_Prozent)

write.csv(guer_top,"guer_top.csv")

guer_flop <- guer_raw %>%
  arrange(Ja_Stimmen_In_Prozent) %>%
  mutate("Pourcentage de non" = 100-Ja_Stimmen_In_Prozent) %>%
  slice(1:50) %>%
  select(4,7) %>%
  rename(Commune = Gemeinde_KT_f)

write.csv(guer_flop,"guer_flop.csv")

#commune qui refuse en Valais (ou le plus faible oui)
#com_cant <- read_csv("C:/Users/yoanv/Documents/R/27sept/results.csv") %>%
#  select(Kanton_Short, Gemeinde_f, Gemeinde_KT_f)