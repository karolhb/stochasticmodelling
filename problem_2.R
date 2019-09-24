tEnd = 59

lambda = 1.5
beta = 10
N = 1000

accPoisson = 0

for (n in 1:N) {
  inc = rpois(1, lambda = lambda*tEnd)
  accPoisson = accPoisson + inc
  accPoisson2 = accPoisson + inc^2
}

accExp = 0

for (n in 1:N) {
  accExp = accExp + rexp(1, beta)
}

print("a)")
expectedPoisson = accPoisson/N
print(expectedPoisson)

print("b)")
expC = accExp/N
expZ = ((accPoisson/N) * (accExp/N))
varC = (accExp/N)^2
varN = expectedPoisson
expN = expectedPoisson
varZ = varC*expN+expC^2*varN
print(expectedExp)
print(varTot)
