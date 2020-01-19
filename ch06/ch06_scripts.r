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


exam %>% 
  mutate(total = math + english + science) %>% 
  arrange(total) %>% 
    head


###################
06-6 집단별로 요약
mpg %>% 
  group_by(manufacturer, drv) %>% 
  summarise(mean_cty = mean(cty)) %>% 
  head

exam %>%
  group_by(class) %>% 
  summarise(mean_math = mean(math),
            sum_math = sum(math),
            median_math = median(math),
            n = n())

mpg %>% 
  group_by(manufacturer) %>% 
  filter(class == "suv") %>% 
  mutate(tot = (cty+hwy)/2) %>% 
  summarise(mean_tot = mean(tot)) %>% 
  arrange(desc(mean_tot)) %>% 
  head(5)
  head
  
  
  mpg %>% 
    group_by(manufacturer) %>% 
    mutate(tot = (cty+hwy)/2) %>% 
    summarise(mean_tot = mean(tot)) %>% 
    arrange(desc(mean_tot)) %>% 
    head(5)

  
  mpg<-as.data.frame(ggplot2:: mpg)
  mpg %>%
    group_by (class) %>% 
    summarise(mean_cty = mean(cty))
    
   
  mpg <- as.data.frame( 의미는?)
  mpg %>%
    group_by(class) %>% 
    summarise(mean_cty = mean(cty)) 
  
  
  mpg<-as.data.frame(ggplot2:: mpg)
  
  mpg %>%
    group_by (class) %>% 
    summarise(mean_cty = mean(cty))
  
  
  ###############
  06-7 데이터 합치기
  
left_join  bind_rows()
  
test1 <- data.frame(id = c(1,2,3,4,5),
                    midterm = c(60, 80, 70, 90, 85)) 
test2 <- data.frame(id = c(1,2,3,4,5),
                    final = c(70, 83, 65, 95, 80))  

test1
test2

total <-left_join(test1, test2, by = "id") 
total


name <- data.frame(class = c(1,2,3,4,5),
                   teacher = c("kim", "lee" ,"park", "choi", "jung")
name


mpg <-as.data.frame(ggplot2:: mpg)

fuel <- data.frame(fl=c("c","d", "e", "p", "r"),
                   price_fl = c(2.35, 2.38, 2.11, 2.76, 2.22),
                   stringsAsFactors = F)

head(mpg)

mpg <- left_join(mpg, fuel, by = "fl")
head(mpg)

midwest<-as.data.frame(ggplot2:: midwest)


str(midwest)


########### 160페이지

midwest <- midwest %>% 
  mutate(ratio_child = (poptotal-popadults)/poptotal*100)
head(midwest)

midwest %>%
  arrange(desc(ratio_child)) %>% 
  select(state, county, ratio_child) %>% 
  head(5)


midwest <- midwest %>% 
  mutate(grade = ifelse(ratio_child >=40, "large",
                        ifelse(ratio_child >=30, "middle", "small")))

table(midwest$grade)         

midwest %>% 
  mutate(ratio_asian = (popasian/poptotal)*100) %>% 
  arrange(ratio_asian) %>% 
  select(state, county, ratio_asian) %>% 
  head(10)
  

