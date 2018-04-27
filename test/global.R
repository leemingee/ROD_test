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

source(paste(getwd(), "simulation.R", sep = "/"))


