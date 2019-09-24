N = 1000
P = matrix(c(0.95, 0.05, 0, 0, 0.80, 0.20, 0, 0, 1), nrow = 3,byrow=TRUE)
print(P)

x = vector('numeric', length = N)
y = vector('numeric', length = N)

for (n in 1:N) {
  xi = 1
  days = 0
  while (xi < 3) {
    xi = sample.int(3, size = 1, replace = TRUE, prob = P[xi,])
    days = days + 1
  }
  x[n] = days
}

for (n in 1:N) {
  yi = 2
  days = 0
  while (yi < 3) {
    yi = sample.int(3, size = 1, replace = TRUE, prob = P[yi,])
    days = days + 1
  }
  y[n] = days
}

expected = sum(x)/N
print(expected)

expected2 = sum(y)/N
print(expected2)

#plot(0:N, x, type = "h", lwd = 1, cex.axis = 1.5, main = "Realization", xlab = "Time", ylab = "Value", cex.lab = 1.5, cex.main = 1.5)