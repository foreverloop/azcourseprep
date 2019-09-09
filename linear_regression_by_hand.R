#linear regression by hand, deliberately I am aware of glm() method and similar
library(tidyverse)
df_exams = read_csv('/Users/charliejones/documents/rstuff/basics/StudentsPerformance.csv')

#re-name the columns to be easier to work with later
colnames(df_exams)[2] <- "eg" #ethnic group...
colnames(df_exams)[6] <- "math_score"
colnames(df_exams)[7] <- "reading_score"
colnames(df_exams)[8] <- "writing_score"

attach(df_exams)

#cast the result to an integer incase of different number of rows in other data
sev_per <- as.integer(nrow(df_exams) * 0.7)

#calculate the deviations for reading_score and math_score
#only use 70% of the data so we have something to test with later
reading_score_deviations = reading_score[0:sev_per] - mean(reading_score[0:sev_per])
math_score_deviations = math_score[0:sev_per] - mean(math_score[0:sev_per])

deviation_products = math_score_deviations * reading_score_deviations
math_score_deviations_sq = sum(math_score_deviations^2)

slope = sum(deviation_products) / math_score_deviations_sq
yintercept = mean(reading_score[0:sev_per]) - (slope * mean(math_score[0:sev_per]))

#this is technically the 'prediction' point e.g 'y = mx + c'
yregress = ((slope * math_score[0:sev_per]) + yintercept)
mean_line = rep(mean(reading_score),sev_per)

check_residuals<-function(observed,predicted){
  return(observed - predicted)
}

residual_errors <- check_residuals(reading_score[0:sev_per],yregress)

#SSE also SST
sse_mean = sum(check_residuals(reading_score[0:sev_per],mean(reading_score[0:sev_per])))

#SSE regression used to find SSR
sse_regression = sum(residual_errors ^ 2)

centroid_y = mean(reading_score[0:sev_per])
centroid_x = mean(math_score[0:sev_per])
plot(centroid_x,centroid_y)

#scatter the points, add the mean line, add the regression line,
#add the centroid marker
ggplot() +
geom_jitter(data=data.frame(x=math_score[0:sev_per],y=reading_score[0:sev_per]),aes(x,y),
            color="#606060",alpha=0.4) +
geom_line(data=data.frame(x=math_score[0:sev_per],y=mean_line),aes(x,y),
          color='salmon') +
geom_line(data=(data.frame(x=math_score[0:sev_per],y=yregress)),aes(x,y),
          color="#608793",size=0.8) +
geom_point(data = data.frame(x=c(centroid_x), y=c(centroid_y)), aes(x,y),
           shape='triangle',size=2,
           color='orangered')

#using the built in library
scatter_with_lm <- ggplot(df_exams, aes(math_score, reading_score)) + 
                   geom_point(color = "#606060") +
                   geom_smooth(method=lm, color="#608793", se=FALSE) +
                   labs(x = "Math score", y = "reading score")

scatter_with_lm