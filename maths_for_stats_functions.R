#negative 5 to 5 in 100 steps of 0.1 each
x <- seq(from=-20, to=20, length=401)

#response values
y <- x^3 - 5*x^2 - 15*x

#help(plot)
plot(x,y,type='l')

#x3 seems to be sometimes x^3 in this context
#y = x^3 - 5x^2 - 15x.
