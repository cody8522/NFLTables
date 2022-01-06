library(tidyverse)
library(dplyr)
library(ggrepel)
library(ggimage)
library(nflfastR)
library(gtExtras)
library(gt)
options(scipen = 9999)

Sim_Results <- read_csv("Sim_Results.csv")

Sim_Results <- Sim_Results %>%
  left_join(teams_colors_logos, by = c('Team' = 'team_abbr'))

Sim_Results <- Sim_Results %>%
  filter(CON == "NFC")%>%
  summarize(team_wordmark, Wins, Playoffs = Playoffs * 100, Division = Division * 100, Conference = Conference * 100, SB = SB * 100)%>%
  arrange(-Playoffs)

Sim_Results %>%
  gt()%>%
  cols_label(team_wordmark= " ")%>%
  cols_align("center")%>%
  gtExtras::gt_img_rows(columns = team_wordmark, height = 20)%>%
  gt_hulk_col_numeric(Playoffs)%>%
  gt_hulk_col_numeric(Division)%>%
  gt_hulk_col_numeric(Conference)%>%
  gt_hulk_col_numeric(SB)%>%
  tab_header(
    title = (
      "NFC Simulation Results"))

