library(tidyverse)
print('finished loading')

#this shows the individual probability for example of a cookie having 0 to 20 chocolate chips
#when the expected number of chips is 4. as we can see, as the number of chips increases
#the probability becomes infinitely small.The most probable outcomes are 3,4,5 and 6 chips
dpois((0:20), lambda = 4)

#graphical representation for 0 to 20 chips in a cookie when the expected number of chips is 4
ggplot(data.frame(x=c(0:20)), aes(x)) +
geom_point(aes(y=dpois(x, lambda=4)))
