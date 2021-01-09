#import
library(tidyverse)

#CHASSE
vot_chasse_raw <- read_csv("https://raw.githubusercontent.com/awp-finanznachrichten/lena/master/Output/Jagdgesetz_dw.csv")

top_chasse <- vot_chasse_raw %>%
  arrange(desc(Ja_Stimmen_In_Prozent)) %>%
  slice(1:10) %>%
  select(4,2) %>%
  rename(Commune = Gemeinde_KT_f,
         "Pourcentage de oui" = Ja_Stimmen_In_Prozent)

write.csv(top_chasse,"chasse_top.csv")

flop_chasse <- vot_chasse_raw %>%
  arrange((Ja_Stimmen_In_Prozent)) %>%
  slice(1:10) %>%
  select(4,2) %>%
  rename(Commune = Gemeinde_KT_f,
         "Pourcentage de oui" = Ja_Stimmen_In_Prozent)

write.csv(flop_chasse,"chasse_flop.csv")

#commune qui refuse en Valais (ou le plus faible oui)
com_cant <- read_csv("C:/Users/yoanv/Documents/R/27sept/results.csv") %>%
  select(Kanton_Short, Gemeinde_f, Gemeinde_KT_f)

chasse_vs <- vot_chasse_raw %>%
  left_join(com_cant) %>%
  select(7,8,2) %>%
  arrange(desc(Ja_Stimmen_In_Prozent)) %>%
  rename(Commune = Gemeinde_f,
         Canton = Kanton_Short,
       "Pourcentage de oui" = Ja_Stimmen_In_Prozent)

write_csv(chasse_vs,"chasse_vs.csv")

#altitude

#VOTE CONGE PATERNITE
vot_pat_raw <-  read_csv("https://raw.githubusercontent.com/awp-finanznachrichten/lena/master/Output/Erwerbsersatz_dw.csv")

top_pat <- vot_pat_raw %>%
  arrange(desc(Ja_Stimmen_In_Prozent)) %>%
  slice(1:10) %>%
  select(4,2) %>%
  rename(Commune = Gemeinde_KT_f,
         "Pourcentage de oui" = Ja_Stimmen_In_Prozent)

write.csv(top_pat,"pat_top.csv")

flop_pat <- vot_pat_raw %>%
  arrange(Ja_Stimmen_In_Prozent) %>%
  slice(1:10) %>%
  select(4,2) %>%
  rename(Commune = Gemeinde_KT_f,
         "Pourcentage de oui" = Ja_Stimmen_In_Prozent)

write.csv(flop_pat,"pat_flop.csv")

#DEDUCTIONS FISCALES
vot_ded_raw <- read_csv("https://raw.githubusercontent.com/awp-finanznachrichten/lena/master/Output/Bundessteuer_dw.csv")

top_ded <- vot_ded_raw %>%
  arrange(desc(Ja_Stimmen_In_Prozent)) %>%
  slice(1:10) %>%
  select(4,2) %>%
  rename(Commune = Gemeinde_KT_f,
         "Pourcentage de oui" = Ja_Stimmen_In_Prozent)

write.csv(top_ded,"ded_top.csv")

flop_ded <- vot_ded_raw %>%
  arrange(Ja_Stimmen_In_Prozent) %>%
  slice(1:10) %>%
  select(4,2) %>%
  rename(Commune = Gemeinde_KT_f,
         "Pourcentage de oui" = Ja_Stimmen_In_Prozent)

write.csv(flop_ded,"ded_flop.csv")