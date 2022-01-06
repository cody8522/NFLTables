library(tidyverse)
library(dplyr)
library(ggrepel)
library(ggimage)
library(nflfastR)
library(gtExtras)
library(gt)
options(scipen = 9999)

Seeding <- read_csv("Seeding.csv")

Seeding <- Seeding %>%
  left_join(teams_colors_logos, by = c('Teams' = 'team_abbr'))

Seeding <- Seeding %>%
  summarize(team_wordmark, LAR, TB, DAL, ARI)
 

Seeding %>%
  gt()%>%
  cols_label(team_wordmark= "Away Team ")%>%
  cols_align("center")%>%
  gtExtras::gt_img_rows(columns = team_wordmark, height = 20)%>%
  gt_hulk_col_numeric(LAR)%>%
  gt_hulk_col_numeric(TB)%>%
  gt_hulk_col_numeric(DAL)%>%
  gt_hulk_col_numeric(ARI)%>%
  tab_header(
    title = (
      "NFC Wild Card Matchups"),
    subtitle = ("Market Derived Probabilities (as a %)"))%>%
  tab_spanner(label = "Home Team", columns = c(LAR, TB, DAL, ARI))