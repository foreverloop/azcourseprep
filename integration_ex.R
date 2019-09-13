#similar to final example of 0 SEN in 5 tests
pbinom(q=0,size=5,p=0.2)

help(polyroot)

equation_coefficients <- c(0,0,3,-1)
polyroot(z=equation_coefficients)

#only the real components of these are our answers, so 0 and 3

#second time polyroot is required to be used:
second_eq_coefficients <- c(0,5,0,-1)
polyroot(second_eq_coefficients)