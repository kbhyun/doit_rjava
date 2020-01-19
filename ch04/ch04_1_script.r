#------------------------
#ch04
install.packages("readxl")
library(readxl);



df_excel<-read_excel("./datas/excel_exam.xlsx")
df_excel<-read_excel("c:/works/ch04/datas/excel_exam.xlsx")



df_csv_excel<-read_excel("./datas/csv_exam.csv")
df_csv_excel

df_csv_exam_string<-read.csv("./datas/csv_exam_string.csv", stringsAsFactors=F);


# RData 저장하기
# R\


english<-c(90, 80, 60,70)
english
math<-c(50,60,100,20)
math
data.frame(english,Math)
df_midterm<-data.frame(english=c(90, 80, 60,70), Math=c(50,60,100,20))
df_midterm


