# Simulation
# I simulate a toy BOD dataset here for a template for shiny app.
# N = 40 # total data points
# k = 3 # clusters
# x.center.min = -10
# x.center.max = 5
# 
# y.center.min = -15
# y.center.max = 15

simulate <- function(N, k, x.center.max, x.center.min, y.center.max, y.center.min){
  x <- rep(NA, N)
  y <- rep(NA, N)
  
  # as we want to make it severe:
  # control the sigma matrix based on the center of each multinomial distribution
  x.interval <- (x.center.max - x.center.min) / (k - 1)
  y.interval <- (y.center.max - y.center.min) / (k - 1)
  n <- round(N/k)
  
  # initialization
  x.centers <- seq(x.center.min, x.center.max, length.out = k)
  y.centers <- seq(y.center.min, y.center.max, length.out = k)
  sigmas <- array( rep(c(x.interval * 0.2, min(x.interval, y.interval) * 0.05 , 
                         min(x.interval, y.interval) * 0.05 , y.interval * 0.2), 4), 
                   dim = c(2, 2, k) )
  
  # sample by each k
  samples <- matrix(ncol = 2)
  for(i in 1:k){
    Sigma = sigmas[, , i]
    tmp = mvrnorm(n, mu = c(x.centers[i], y.centers[i]), Sigma)
    samples <- rbind(samples, tmp)
  }
  
  plot(samples[-1, ])
}


# The one I find most interesting involves using Shiny for visualizations in the notes--like Figures 1.1 and 1.2, especially if we could do something with clustering, serial correlation, etc.

# Optional Data Set
# http://www.cpds-data.org/index.php/data
## Seems to be famous and informative, with 1614 objects with 304 variables.
## 36 countries included, which is really a standard ROD data.
## But I must say, the hetrogeneity Bias here may not be so strong in this dataset 

# Sigma <- matrix(c(0.5,0.1,0.5,0.1),2,2)
# Sigma
# a = mvrnorm(n=1000, rep(0, 2), Sigma)
# plot(a)
