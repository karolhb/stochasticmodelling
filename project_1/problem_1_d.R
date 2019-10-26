# number of simulations
N = 1000

# transition probability matrix
P = matrix(c(0.95, 0.05, 0, 0, 0.80, 0.20, 0, 0, 1), nrow = 3,byrow=TRUE)

# print matrix
print(P)

# store results in vectors/arrays
x = vector('numeric', length = N)
y = vector('numeric', length = N)

# simulate N times for initial state 1
for (n in 1:N) {
  xi = 1
  days = 0
  while (xi < 2) {
    xi = sample.int(3, size = 1, replace = TRUE, prob = P[xi,])
    days = days + 1
  }
  x[n] = days
}

# simulate N times for initial state 2
for (n in 1:N) {
  yi = 2
  days = 0
  while (yi < 3) {
    yi = sample.int(3, size = 1, replace = TRUE, prob = P[yi,])
    days = days + 1
  }
  y[n] = days
}

# calculate average time from state 1 (susceptible) to state 2 (infected)
u1 = sum(x)/N
print(u1)

# calculate average time from state 2 (infected) to state 3 (recovered)
u2 = sum(y)/N
print(u2)