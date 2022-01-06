library(tidyverse)
library(dplyr)
library(ggrepel)
library(ggimage)
library(nflfastR)
library(gtExtras)
library(gt)
options(scipen = 9999)

Outcomes <- read_csv("Outcomes.csv")


Outcomes %>%
  arrange(-Probability)%>%
  gt()%>%
  cols_align("center")%>%
  gt_hulk_col_numeric(Probability)%>%
  tab_header(
    title = (
      "NFC Week 18 Scenarios"),
    subtitle = ("Market Derived Probabilities"))