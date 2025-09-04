library(tidyverse)

mpg

glimpse(mpg)

mpg_year1999 <- mpg %>% 
  filter(year == 1999)

glimpse(mpg_year1999)
