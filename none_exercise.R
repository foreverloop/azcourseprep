#code which is not explicitly an exercise...but may be useful to have in reference

#trig functions are in the base of R
cos(pi)
sin(3*pi/2)
tan(pi/6)

#exponential (e^x) and log(x) are in the base of R
exp(1)
log(100,base=10) #number to raise for, base, return value is log of given arguments

#modulus is two percentage symbols (returns remainder after division)
16%%3
10%%5

#a more involved calculation
sqrt(3/4) / (1/3 - 2/pi^2)

apple <-20-16
banana <- 4 + 5 
apple - banana
apple
banana

#R is case sensitive as expected. so Apple != apple as a variable

#re-assignment and incrementation
apple <- -100
apple <- apple +1
apple

#scalar addition of a vector
x <- c(1, 2, 77, 2, -2, 14) 
y <- 2
x+y

#scalar multiplication of a vector
x*y

#raising entire vector to a power
x^y

#unless re-assigning, objects are not mutateable
x
y <- c(1, 1, 2, 2, 3, 3)

length(x)
length(y)

#to multiply or add vectors they need to be the same length
#this was checked earlier, so we can do the below operations
x + y
x*y

#the same order of operations applies to both vectors and scalar values
2*x + y
2*(x + y)

x <- seq(from=1, to=10, by=1)
x
y <- seq(from=1, to=10, by=2)
y

x <- 0:15
x
y <- 6:-6
y

G <- 6.6728*10^-11
r_earth <- 6.371*10^6
m <- 5.9736*10^24
r <- r_earth
a <- G*m/r^2
a

#effect of gravity as distance km from earth increase
dist <- seq(from=0, to=20350*1000, by=10)
r <- r_earth + dist
a <- G*m/r^2
dist_km <- dist / 1000
plot(x=dist_km, y=a, type="l")

#R becomes unresponsive if you run this below
#but it is just the same as the above plot except with circle points
#instead of a line
#plot(x=dist_km, y=a)

#bodmas applies. brackets always take precedence for completion
6*(5+2)^2/(2+6-9)/7*2


