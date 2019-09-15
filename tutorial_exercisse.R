# 1. Evaluate the following expressions: 
# (a) 492 −542 42+632
# (b) a2 for a = 1,2,...,10
# 2. Create plots for different powers of x:
# (a) Create a vector, x, which goes from -100 up to 100. 
# (b) Create a new plot showing y = x2.
# (c) Add a red line to the existing plot showing y = x4.

#ex 1a evaluate
(49^2 - 542) / (42 + 63^2)

#ex 1b evaluate square numbers 1 to 10
square_numbers <- c(1:10)^2
square_numbers

#ex 2(a) Create a vector, x, which goes from -100 up to 100. 
two_hundred_vec <- c(-100:100)
two_hundred_vec

# 2(b) Create a new plot showing y = x2.
plot(x=two_hundred_vec,y=two_hundred_vec^2,type='l')
curve (x^4,add=TRUE,col='red')