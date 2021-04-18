#' ab_pkgload
#'
#' @param pkgs A character vector containing the names of R package to be loaded
#' @param session A logical to indicate whether the session.info should be printed
#'
#' @return
#' @export
#'
#' @examples
#' ab_pkgload(pkgs = c("dplyr", "magrittr"))
ab_pkgload <- function(pkgs, session = TRUE) {

  if(!base::require("pacman")) {
    utils::install.packages("pacman")
    base::library("pacman")
  }

  pkgs <- c(
    "pacman",
    # "tidyverse",
    "magrittr",
    "geepack",
    "reshape2",
    "broom"
  )

  pacman::p_load(char = pkgs)

  xfun::session_info(packages = pkgs, dependencies = FALSE)

}
