#Assignment 2 a


# =====================================================================================
#     PT I) Calculation of probabilities &  MC-Simulations
# =====================================================================================
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

cat("Probability of having 100 or more claims is ", percentageClaimOver100, " percent")

#2a) 
# =========================================================================================
# Realizations
#==========================================================================================




tEnd = 59
lambda = 1.5
eventVector <- list()
timeVector <- list()


colorz <- c("blue","green", "red","cyan", "coral", "chocolate", "darkorange","goldenrod", "gray", "deeppink")
text = c("1","2", "3","4","5","6","7","8","9","10")
plot(NULL, NULL, xlim = c(0, tEnd), ylim = c(0, 110),cex.lab = 1, cex.axis = 1, xlab = "Time", ylab = "Claims", main = "Realizations")
# Run 10 realizations
for (k in 1:10){
  nP = rpois(1, lambda = lambda*tEnd)
  tVals = runif(nP, min = 0, max = tEnd)
  tVals = c(0, sort(tVals), tEnd)
  xVals = c(0:nP, nP)
  for(i in 1:(length(xVals)-1)){
    lines(tVals[i:(i+1)],   col = colorz[k], type = "l", rep(xVals[i],2))
  }
}
grid( col = "lightgray", lty = "dotted",
     lwd = par("lwd"), equilogs = TRUE)
legend("right",
       legend = text,
       fill = colorz,
       lty = 1,
       cex = 0.6,
       box.lty=0
)







