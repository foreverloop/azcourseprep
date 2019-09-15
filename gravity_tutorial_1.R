# ========================================================
# Look at the relationship between acceleration due to
# gravity and distance from the Earth's surface.
#
# ref: http://en.wikipedia.org/wiki/Gravity_of_Earth
#
# ========================================================
# --------------------------------------------------------
# Constants
# --------------------------------------------------------
# Gravitational constant (m^3 kg^-1 s^-2)
G <- 6.6728*10^-11
# Approximate average radius of the Earth (m)
r_earth <- 6.371*10^6
# Approximate mass of the Earth (kg)
m <- 5.9736*10^24
# --------------------------------------------------------
# generate distance vector
# from Earth's surface (0m)
# up to the orbit height of GPS satelites (20,350 km)
# at 1km intervals
# --------------------------------------------------------
dist <- seq(from=0, to=35880*1000, by=1000)
# we measure from the centre of the Earth to the centre of
# the other object:
r <- r_earth + dist
# --------------------------------------------------------
# Earth's gravitational acceleration based on distance
# --------------------------------------------------------
a <- G*m/r^2
# --------------------------------------------------------
# produce the plot
# --------------------------------------------------------
# set distance to km instead of m for x-axis labels
dist_km <- dist / 1000
plot(x=dist_km, y=a, type="l")

#source itself...and run the entire code again
source("/Users/charliejones/documents/rstuff/gravity_tutorial_1.R")

source("/Users/charliejones/documents/rstuff/gravity_function_ex.R")

# mass
mercury_mass <- 3.301 * 10^23
venus_mass <- 4.867 * 10^24
mars_mass <- 6.417 * 10^23
jupiter_mass <- 1.899 * 10^27
saturn_mass <- 5.685 * 10^26
uranus_mass <- 8.682 * 10^25
neptune_mass <- 1.024 * 10^26

#radius
mercury_radius <- 2.4397 * 10^6
venus_radius <- 6.0513 * 10^6
mars_radius <- 3.3895 * 10^6
jupiter_radius <- 6.9911 * 10^7
saturn_radius <- 5.8232 * 10^7
uranus_radius <- 2.5362 * 10^7
neptune_radius <- 2.4622 * 10^7

calc_gravity(mass=4.867*10^23, radius=6.0518*10^3)
#ex 1a. works ok. But seems like way too much gravity everywhere except earth
calc_gravity(distance=0,mass =mercury_mass, radius = mercury_radius)
calc_gravity(distance=0,mass=venus_mass,radius = venus_radius)
calc_gravity() #earth by deafult
calc_gravity(distance = 0,mass=mars_mass,radius = mars_radius)
calc_gravity(distance = 0,mass=jupiter_mass,radius = jupiter_radius)
calc_gravity(distance = 0,mass=saturn_mass,radius = saturn_radius)
calc_gravity(distance = 0,mass=uranus_mass,radius = uranus_radius)
calc_gravity(distance = 0,mass=neptune_mass,radius = neptune_radius)

#ex 1b. plot to orbit height of Phobos, a moon orbiting mars 9376
phobos_height <- 9.376 * 10^3
phobos_dists <- seq(from=0, to=phobos_height, by=100)
plot(x=phobos_dists, y=calc_gravity(distance=phobos_dists,
                                    mars_mass,
                                    mars_radius), type="l")

