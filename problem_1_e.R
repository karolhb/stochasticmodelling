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
# each column contains Sn, In and Rn for 1 step
y = matrix('numeric', nrow = 3, ncol = 0)
y = cbind(y, c(Sn, In, Rn))

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
}

print(y[,N])
x = 1:length(y[1,])

# plots
text = c("Sn","In", "Rn")
plot(x, y[1,], type = "l", col = "blue", cex.lab = 1, cex.axis = 1, xlab ="Steps", ylab = "State", main = "Evolution of Yn over time")
lines(x, y[2,], col="red", type = "l")
lines(x, y[3,], col="green", type = "l")
legend("right",
       legend = text,
       fill=c("blue","red", "green"),
       lty = 1,
       cex = 0.6,
       box.lty=0
)