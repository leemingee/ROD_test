# global
# import the dataset

packages.used <- c(
  "tidyverse",
  "data.table",
  "readxl",
  "shiny", 
  "MASS"
)


packages.needed <- setdiff(packages.used, 
                           intersect(installed.packages()[,1], 
                                     packages.used))
if( length(packages.needed) > 0 ){
  install.packages(packages.needed, dependencies = T)
}

library(tidyverse)
library(data.table)
library(readxl)
library(shiny)
library(MASS)

# source(paste(getwd(), "simulation.R", sep = "/"))
# cpds <- readxl::read_xlsx("CPDS-1960-2015-Update-2017.2.xlsx")
# names(cpds)


simulate <- function(N, k, x.center.max, x.center.min, y.center.max, y.center.min){
  # as we want to make it severe:
  # control the sigma matrix based on the center of each multinomial distribution
  x.interval <- (x.center.max - x.center.min)/(k - 1)
  y.interval <- (y.center.max - y.center.min)/(k - 1)
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
