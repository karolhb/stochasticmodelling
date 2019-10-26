# number of simulations
M = 1000

# initialize lists of a fixed (great enough) length
highestNumberVector = vector('numeric', length = M)
highestIndexVector = vector('numeric', length = M)

for (k in 1:M){
  # total population
  t = 1000
  
  # initial population in each state
  Sn = 950
  In = 50
  Rn = 0
  
  # initialize parameters
  N = 200
  beta = 0.5*In/t
  gamma = 0.2
  P = matrix(c(1-beta, beta, 0, 0, 1-gamma, gamma, 0, 0, 1), nrow = 3,byrow=TRUE)
  
  # initialize the highest number and the corresponding index as 0 and 1,
  # respectively at each realization.
  
  highestNumber = 0
  highestIndex = 1
  for (n in 1:N) {
    InInc = min(Sn, rbinom(1, Sn, beta))
    RnInc = min(In, rbinom(1,In,gamma))
  
    In = In + InInc
    Sn = Sn - InInc
    Rn = Rn + RnInc
    In = In - RnInc
    
    # update beta and matrix
    beta = 0.5*In/t
    P = matrix(c(1-beta, beta, 0, 0, 1-gamma, gamma, 0, 0, 1), nrow = 3,byrow=TRUE)
    
    if( In >= highestNumber ){
      highestNumber = In
      highestIndex = n
    }
  }
  # append the maximum and the index to a vector
  # reinitialize both maximum and the index as in 1)
  highestNumberVector[k] = highestNumber
  highestIndexVector[k] = highestIndex
}

# estimated expected maximum number of infected individuals
# calculate the average of the maximum from the M simulations
expMaxInf = sum(highestNumberVector)/M
cat("Estimated expected maximum number of infected individuals: ", expMaxInf)

# estimated expected time at which the maximum number of infected individuals is reached
# calculate the average of the index of the maximum from the M simulations
expMaxTime = sum(highestIndexVector)/M
cat("\nEstimated expected time of maximum number of infected individuals: ", expMaxTime)

