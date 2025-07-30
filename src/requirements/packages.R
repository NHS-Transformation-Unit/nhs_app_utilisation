
# Package List ------------------------------------------------------------

packages <- c("here",
              "dplyr",
              "lubridate",
              "ggplot2",
              "readxl",
              "scales",
              "tidyr",
              "binom",
              "stringr")


# Load Packages -----------------------------------------------------------

load_packages <- function(packages){
  
  missing_packages <- setdiff(packages, installed.packages()[,"Package"])
  
  if (length(missing_packages) > 0) {
    install.packages(missing_packages)
  }
  
  lapply(packages, function(pkg) {
    library(pkg, character.only = TRUE)
  })
  
}

load_packages(packages)