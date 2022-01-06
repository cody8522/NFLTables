library(tidyverse)
library(dplyr)
library(ggrepel)
library(ggimage)
library(nflfastR)
library(gtExtras)
library(gt)
options(scipen = 9999)

Model_Projections <- read_csv("Model_Projections.csv")

Model_Projections <- Model_Projections %>%
  left_join(teams_colors_logos, by = c('Away' = 'team_abbr'))

Model_Projections <- Model_Projections %>%
  summarize(Away, Home, TL_Margin, PL_Margin, Market_Line, away_wordmark = team_wordmark)

Model_Projections <- Model_Projections %>%
  left_join(teams_colors_logos, by = c('Home' = 'team_abbr'))

Model_Projections <- Model_Projections %>%
  summarize(away_wordmark, home_wordmark = team_wordmark, TL_Margin, PL_Margin, Market_Line)

Model_Projections %>%
  gt()%>%
  cols_label(away_wordmark= "Away")%>%
  cols_label(home_wordmark= "Home")%>%
  cols_label(away_wordmark= "TL Margin")%>%
  cols_label(away_wordmark= "PL Margin")%>%
  cols_label(away_wordmark= "Market Line")%>%
  cols_align("center", TL_Margin)%>%
  cols_align("center", PL_Margin)%>%
  cols_align("center", Market_Line)%>%
  gtExtras::gt_img_rows(columns = away_wordmark, height = 20) %>%
  gtExtras::gt_img_rows(columns = home_wordmark, height = 20) %>%
  gtExtras::gt_theme_538()
