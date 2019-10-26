# number of days
tEnd = 59

# initialize parameters
lambda = 1.5
beta = 10
N = 1000

# initialize counting variable to 0
accPoisson = 0

# simulate N times
for (n in 1:N) {
  inc = rpois(1, lambda = lambda*tEnd)
  accPoisson = accPoisson + inc
  accPoisson2 = accPoisson + inc^2
}

accExp = 0

for (n in 1:N) {
  accExp = accExp + rexp(1, beta)
}


# calculating the expected total claim amount and
# the variance of the total claim amount with the
# same formulas as the analytical computation
expectedPoisson = accPoisson/N

expC = accExp/N
varC = (accExp/N)^2
varN = expectedPoisson
expN = expectedPoisson
expZ = (expC*expN)
varZ = varC*expN+expC^2*varN
cat("E[Z] = ", expZ)
cat("\nVar[Z] = ", varZ)
