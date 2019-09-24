# total population:
t = 1000
Sn = 950
In = 50
Rn = 0

N = 200
beta = 0.5*In/t
gamma = 0.2
P = matrix(c(1-beta, beta, 0, 0, 1-gamma, gamma, 0, 0, 1), nrow = 3,byrow=TRUE)

y = matrix('numeric', nrow = 3, ncol = 0)
y = cbind(y, c(Sn, In, Rn))
print(y)

for (n in 1:N) {
  InInc = min(Sn, rbinom(1, Sn, beta))
  RnInc = min(In, rbinom(1,In,gamma))
  
  In = In + InInc
  Sn = Sn - InInc

  Rn = Rn + RnInc
  In = In - RnInc
  
  #print(rbinom(1, Sn, beta))
  #print(rbinom(1, In, gamma))
  print("beta:")
  print(beta)
  print("Sn:")
  print(Sn)
  print("In:")
  print(In)
  print("Rn:")
  print(Rn)
  
  y = cbind(y, c(Sn, In, Rn))
  
  beta = 0.5*In/t
  P = matrix(c(1-beta, beta, 0, 0, 1-gamma, gamma, 0, 0, 1), nrow = 3,byrow=TRUE)
}

print(y[,N])