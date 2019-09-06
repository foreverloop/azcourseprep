library(tidyverse)
df_exams = read_csv('/Users/charliejones/documents/rstuff/basics/StudentsPerformance.csv')

#re-name the columns to be easier to work with later
colnames(df_exams)[2] <- "eg" #ethnic group...
colnames(df_exams)[6] <- "math_score"
colnames(df_exams)[7] <- "reading_score"
colnames(df_exams)[8] <- "writing_score"

attach(df_exams)
view(df_exams)

ggplot(data = df_exams) +
geom_point(mapping = aes(x = math_score, y = reading_score,color=eg),position='jitter')
