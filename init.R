my_packages = c("plyr","shiny","shinythemes","leaflet","dplyr","plumber","jsonlite","devtools")

install_if_missing = function(p) {
  if (p %in% rownames(installed.packages()) == FALSE) {
    install.packages(p, dependencies = TRUE)
  }
  else {
    cat(paste("Skipping already installed package:", p, "\n"))
  }
}
invisible(sapply(my_packages, install_if_missing))

devtools::install_github('abresler/markovifyR', force = TRUE)
markovifyR::install_markovify()
