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

# y is an array to keep the results
y = matrix('numeric', nrow = 3, ncol = 0)
y = cbind(y, c(Sn, In, Rn))


#Initialize lists of a fixed(great enough) length
highestNumberVector<-list(1000)
highestIndexVector<-list(1000)

for (k in 1:1000){
  #initialize the highest number and the corresponding index as 0 and 1,
  #respectively at each realization.
  
  highestNumber <-0
  highestIndex <- 1
  for (n in 1:N) {
    InInc = min(Sn, rbinom(1, Sn, beta))
    RnInc = min(In, rbinom(1,In,gamma))
  
    In = In + InInc
    Sn = Sn - InInc
    Rn = Rn + RnInc
    In = In - RnInc
    
    # add result to array
    y = cbind(y, c(Sn, In, Rn))
    
    # update beta and matrix
    beta = 0.5*In/t
    P = matrix(c(1-beta, beta, 0, 0, 1-gamma, gamma, 0, 0, 1), nrow = 3,byrow=TRUE)
    
    if( y[2][n] >= highestNumber ){
      highestNumber <- y[2][n]
      highestIndex <-n
    }
  }
  #Append the maximum and the index to a vector
  #Reinitialize both maximum and the index as in 1)
  highestNumberVector[k]<-highestNumber
  highestIndexVector[k]<-highestIndex
}

#Take the average of the values of highestNumberVector and highestIndexVector
# Initialize to highestExpected and highestIndex respectively 


print(highestNumberVector)
