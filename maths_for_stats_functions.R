#various probability distributions from
#the pre course warm up exercises

#negative 5 to 5 in 100 steps of 0.1 each
x <- seq(from=-5, to=10, length=101)

#response values
y <- x^3 - 5*x^2 - 15*x

#help(plot)
plot(x,y,type='l')

#x3 seems to be sometimes x^3 in this context
#y = x^3 - 5x^2 - 15x.

#part 2 (question 4)
curve(x^3 - 5*x^2 - 15 * x, from=-5, to=10)

#part 3, plot: y =exp [-(3-x)2]; x ∈ {0,...,6}
x <- seq(from=0, to=6, length=101)

#response values
y = exp(-(3-x)^2)

#help(plot)
plot(x,y,type='l')

#part 6? interactive R time either way...wouldn't try this for something robust
#function (μ = 0, σ2 = 1) with x ∈ {-3,...,3}.
#basically entered the normal distribution function into the curve function

mu <- 0
sigma <- 1
curve (1/sqrt(2*pi*sigma^2) * exp (-(x-mu)^2/(2*sigma^2)), from=-3, to=3)

#Use the points() function to add to the figure created in Question 7 
#a similar normal probability density function with parameters µ = 1,  σ2 = 1.5. 
mu <- 1
sigma <- 1.5
curve (1/sqrt(2*pi*sigma^2) * exp (-(x-mu)^2/(2*sigma^2)),add=TRUE,col = 'salmon')

#Use the curve() function 
#to plot the function x^a−1 * (1−x)^β−1;x∈{0,....1} where α=2 and β=3.
alpha <- 2
beta <- 3
curve (x^(alpha-1) * (1-x)^(beta-1),from=0, to=1)

alpha <- 3
beta <- 2
curve (x^(alpha-1) * (1-x)^(beta-1),add=TRUE,col='red')

#Use the curve () function to plot the function 
#x^a-1 * (1-x)^β-1; x ∈ {-10,...,10} where α = 2 and β =3.
alpha <- 2
beta <- 3
curve (x^(alpha-1) * (1-x)^(beta-1),from=-10, to=10)
