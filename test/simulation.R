# The one I find most interesting involves using Shiny for visualizations in the notes--like Figures 1.1 and 1.2, especially if we could do something with clustering, serial correlation, etc.

# Simulation
# I simulate a toy BOD dataset here for a template for shiny app.
# used for test
# N = 400 # total data points
# k = 3 # clusters
# x.center.min = -10
# x.center.max = 5
# 
# y.center.min = -15
# y.center.max = 15
# 
# slope = 1
# interval.ratio = 0.8  #(0-1)


simulate <- function(N, k, x.center.max, x.center.min, y.center.max, y.center.min){
  # as we want to make the Heterogeneity severe:
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
  # plot(tmp)
  # lines(lm(tmp[, 1] ~ tmp[, 2]))
  
  plot(samples[-1, ])
}

## template for sample 2-d nomial data
# Sigma <- matrix(c(0.5,0.1,0.5,0.1),2,2)
# Sigma
# a = mvrnorm(n=1000, rep(0, 2), Sigma)
# plot(a)


simulate_linear <- function(N, k, x.center.max, x.center.min, y.center.max, y.center.min, 
                            slope, interval.ratio){
  
  x <- vector()
  y <- vector()
  x.interval <- (x.center.max - x.center.min) / (k - 1)
  y.interval <- (y.center.max - y.center.min) / (k - 1)
  n <- round(N/k)
  
  # here, create several parallel lines
  # sample the error terms
  # sample within specify x intervals in each line
  # add them as observations and plot
  
  # slope <- y.interval/x.interval
  x.centers <- seq(x.center.min, x.center.max, length.out = k)
  y.centers <- seq(y.center.min, y.center.max, length.out = k)
  lines <- matrix(ncol = 2, nrow = k)
  for(i in 1:k){
    x_i <- rnorm(n, mean = x.centers[i], sd = interval.ratio * x.interval)
    errs <- rnorm(n, mean = 0, sd = interval.ratio * 0.5 * y.interval)
    y_i <- (x_i - x.centers[i]) * slope + y.centers[i] + errs
    lines[i, ] <- lm(y_i ~ x_i)$coefficients
    x <- c(x, x_i)
    y <- c(y, y_i)
  } 
  plot(x, y)
  abline(lm(y~x)$coefficients)
  for(i in 1:k){
    abline(lines[i, ], col = "red")
  }
}


