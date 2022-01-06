library(tidyverse)
library(dplyr)
library(ggrepel)
library(ggimage)
library(nflfastR)
library(gtExtras)
library(gt)
options(scipen = 9999)

Seed_Chance <- read_csv("Seed_Chance.csv")

Seed_Chance <- Seed_Chance %>%
  left_join(teams_colors_logos, by = c('Teams' = 'team_abbr'))


Seed_Chance %>%
  gt()%>%
  cols_move_to_start(team_wordmark)%>%
  cols_hide(columns = c(Teams,team_name, team_id, team_nick, team_color, team_color2, team_color3, team_color4, team_logo_wikipedia, team_logo_espn))%>%
  cols_label(team_wordmark= "Team")%>%
  cols_align("center")%>%
  gtExtras::gt_img_rows(columns = team_wordmark, height = 20)%>%
  gt_hulk_col_numeric(8)%>%
  gt_hulk_col_numeric(2)%>%
  gt_hulk_col_numeric(3)%>%
  gt_hulk_col_numeric(4)%>%
  gt_hulk_col_numeric(5)%>%
  gt_hulk_col_numeric(6)%>%
  gt_hulk_col_numeric(7)%>%
  tab_header(
    title = (
      "Odds Of Obtaining Each Seed in NFC"),
    subtitle = ("Market Derived Probabilities (as a %)"))%>%
  tab_spanner(label = "Seed", columns = c(1,2,3,4,5,6,7,8))