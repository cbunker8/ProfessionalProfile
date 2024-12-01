rm(list = ls())
library(DescTools)
library(tidyverse)
library(plotfunctions)
library(tinytex)
library(lubridate)
library(ggrepel)
library(ggplot2)
library(hexbin)
library(extrafont)
library(dplyr)
library(scales)
library(sf)





master1.5=read_csv("master1.5.csv")


#########################


master1.5 <- master1.5 %>%
  mutate(death_category = case_when(
    total_deaths_per_million < 200 ~ "Under 200 Dead",
    total_deaths_per_million >= 3000 ~ "3000+ Dead",
    TRUE ~ "200 - 1999 Dead"
  ))


plot2 <- ggplot(master1.5, aes(x = total_deaths_per_million)) +
  geom_histogram(binwidth = 133, fill = "#A0522D", color = "white") + # History book color scheme
  theme_classic() +
  labs(
    title = "Distribution of Reported COVID-19 Deaths per Million",
    subtitle = "As of April 25, 2022",
    x = "Total Deaths per Million",
    y = "Number of Countries",
    caption = "Source: ourworldindata.org"
  ) +
  theme(
    plot.title = element_text(hjust = 0.5, size = 16, family = "Georgia"),
    plot.subtitle = element_text(hjust = 0.5, size = 12, family = "Georgia"),
    plot.caption = element_text(hjust = 0, family = "Georgia", size = 10),
    text = element_text(size = 14, family = "Times New Roman"),
    legend.position = "none"
  ) +
  scale_y_continuous(labels = scales::comma_format()) +
  scale_x_continuous(labels = scales::comma_format())


saveRDS(plot2, file = "histogram_plot.rds")


plot2


################################
