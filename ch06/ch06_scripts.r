#------------------------------------
# ch06
#------------------------------------
library(dplyr)

exam<-read.csv("../datas/csv_exam.csv")
exam

exam %>% filter(class == 1)

exam %>% filter(class > 1)


exam <- read_excel("../datas/excel_exam.xlsx")
exam %>% filter(class %in% c(1,3,5))


mpg <- as.data.frame(ggplot2 :: mpg)
mpg_a <- mpg %>% filter(displ <= 4)
mpg_b <- mpg %>% filter(displ >= 5)

mean(mpg_a$hwy)
mean(mpg_b$hwy)



mpg_new <-mpg %>% filter(manufacturer %in% c("chevrolet", "ford", "honda"))
mean(mpg_new$hwy)


exam %>% select(math)
exam %>% select(english)
exam %>% select(class,math, english)

exam %>% select(-math,-english )
%>% 
  
exam %>% 
  filter(class == 1) %>% 
  select(english)


exam %>% 
  select(id, math) %>% 
  tail

mpg <- as.data.frame(ggplot2::mpg)
mpg

exam %>% 
  mutate(total = math + english + science) %>%
  head

exam %>% 
  mutate(total = math + english + science,
         mean = (math + english + science)/3) %>%
  head
