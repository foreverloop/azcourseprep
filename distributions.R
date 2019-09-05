library(tidyverse)
print('finished loading')

#this shows the individual probability for example of a cookie having 0 to 20 chocolate chips
#when the expected number of chips is 4. as we can see, as the number of chips increases
#the probability becomes infinitely small.The most probable outcomes are 3,4,5 and 6 chips
dpois((0:20), lambda = 4)

#graphical representation for 0 to 20 chips in a cookie 
#when the expected number of chips is 4
#effectively shows INDIVIDUAL probabilities of numbers of chips
ggplot(data.frame(x=c(0:20)), aes(x)) +
geom_point(aes(y=dpois(x, lambda=4)))

#this looks CUMULATIVE and only really tells us we've observed most probabilities
#after considering up to only 10 chips
ggplot(data.frame(x=c(0:20)), aes(x)) +
geom_point(aes(y=ppois(x, lambda=4)))

dbinom(x=(0:10),size=150,prob=1/150)

#geom line included just for aesthetic reasons. 
#This is a DISCRETE probability distribution
#the odds of 0 to 10 successes on a sample size of 150
#with a probability of 1/50
ggplot(data.frame(x=c(0:10)), aes(x)) +
geom_point(aes(y=dbinom(x=x,size=150,prob=1/50)),color='red') +
geom_line(aes(y=dbinom(x=x,size=150,prob=1/50))) 

pbinom(q=(0:10), size=150, prob=1/50, lower.tail = TRUE, log.p = FALSE)
#more than 7 successes is extremely unlikely
ggplot(data.frame(x=c(0:10)), aes(x)) +
geom_point(aes(y=pbinom(q=x,size=150,prob=1/50)),color='red')

help(dnorm)
dnorm(x=(0:10), mean = 1/50, sd = 1/10, log = FALSE)

#geom point added just for practice, no statistical bearing on anything
ggplot(data.frame(x=c(0:100)), aes(x)) +
geom_line(aes(y=dnorm(x=x,mean=50,sd=25))) +
geom_point(data=data.frame(x=c(23,10),y=c(0.010,0.012)),y=c(0.010,0.012),
           shape='square',color='salmon')

ggplot(data.frame(x=c(0:100)), aes(x)) +
geom_line(aes(y=pnorm(q=x,mean=50,sd=25)))

help("Chisquare")
dchisq(x=(0:10), df=1:50, ncp = 5, log = FALSE)

ggplot(data.frame(x=(0:50)),aes(x)) +
geom_line(aes(y=dchisq(x=x,df=0:50,ncp=5))) +
geom_line(aes(y=dchisq(x=x,df=0:50,ncp=2)),color='salmon') +
geom_line(aes(y=dchisq(x=x,df=0:50,ncp=.5)),color='green') +
geom_line(aes(y=dchisq(x=x,df=4:6,ncp=.02)),color='red')