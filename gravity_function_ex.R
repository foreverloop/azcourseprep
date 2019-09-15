calc_gravity <- function(distance=0,mass=5.9736*10^24, radius=6.371*10^6) {
  # constants
  G <- 6.6728*10^-11
  # calculation
  r <- radius + distance
  a <- G*mass/r^2
  return(a) }

#calc_gravity()

# on the surface of Saturn
calc_gravity(mass=5.683*10^26, radius=5.8*10^7)
