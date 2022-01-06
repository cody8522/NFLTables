library(tidyverse)
library(dplyr)
library(ggrepel)
library(ggimage)
library(nflfastR)
library(gtExtras)
library(gt)
options(scipen = 9999)

Outcomes <- read_csv("Scenarios.csv")


Outcomes %>%
  gt()%>%
  cols_align("center")%>%
  tab_header(
    title = (
      "NFC Week 18 Scenarios"),
    subtitle = ("Order of Seeds in Each Scenario"))%>%
  tab_spanner(label = "Seed", columns = c(2,3,4,5,6,7,8))