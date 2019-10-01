#Assignment 2 a



tEnd = 59
l = 1.5 #Renamed to l, in case lambda is a restricted keyword

mu = l*tEnd

# i)

numberOfClaims <- ppois(q = 100, lambda = mu, lower.tail = FALSE)

print(numberOfClaims)


# Simulation and verification

rm(list = ls())

n = 1000
tEnd = 59
l = 1.5 #Renamed to l, in case lambda is a restricted keyword



mu = l*tEnd


counter <-0


# Run simulation 1000 times, append to a vector
# Count the number of instances with a value higher than 100
# Divide this number by the total amount of simulations
# Increment each time the value is higher or equal to 100



  for (i in 1:n){
    val <- rpois(1, lambda = mu)
    l[i] <- val
    if (l[i]>100){
     counter = counter+1
    }
  }



percentageClaimOver100 <- counter/n * 100


sprintf("Probability of having 100 or more claims is %f percent", percentageClaimOver100 )

