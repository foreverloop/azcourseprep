library(tidyverse)
df_exams = read_csv('/Users/charliejones/documents/rstuff/basics/StudentsPerformance.csv')

#re-name the columns to be easier to work with later
colnames(df_exams)[2] <- "eg" #ethnic group...
colnames(df_exams)[6] <- "math_score"
colnames(df_exams)[7] <- "reading_score"
colnames(df_exams)[8] <- "writing_score"

typeof(df_exams)
attributes(df_exams)
attach(df_exams)

ggplot(data = df_exams) +
geom_point(mapping = aes(x = math_score, y = reading_score,color=eg),position='jitter')

df_exams["total_score"] = df_exams["math_score"] + df_exams["reading_score"] + df_exams["writing_score"]
df_exams["total_over_200"] = df_exams["total_score"] >= 200

df_summary <- select(df_exams,gender,total_over_200)
#INEFFICIENT
df_summary["gender"] = (df_summary['gender'] == 'male') # change the string to a boolean

#gender: True = male, False = Female
count(df_summary, gender)
count(df_summary, total_over_200)
count(df_summary, total_over_200, gender)

#chi squared test in action for the pupil's exam score totals
#chi squared test is used to test if differences in category counts are significant
N <- as.table(rbind(c(317,201),c(239,243)))
dimnames(N) <- list(gender = c("F", "M"),
                    score = c("Score Over 200","Score Not over 200"))

(Xsq <- chisq.test(N,correct=TRUE))  
Xsq$observed
Xsq$expected
# low p-value tells us this is unlikely to be 'accidental', 
#we can accept the alternative hypothesis:
#more males were not over 200 total than expected
#more females were over 200 total than expected
#fewer females were not over 200 total than expected
#fewer males were over 200 total than expected

