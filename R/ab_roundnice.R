#' ab_roundnice
#'
#' @param x a numeric value
#' @param dig the number of digits to be rounded to
#' @param numeric whether the result should be numeric or character
#' @param less_than whether values rounded to 0 should be reported with less than sign (eg, for P-values)
#' @return
#' @export
#'
#' @examples
#' x <- c(0.4567, 0.0005001, 0.0004999, 0.0005000)
#' ab_roundnice(x = x, dig = 3, numeric = FALSE, less_than = TRUE)
#' ab_roundnice(x = x, dig = 3, numeric = FALSE, less_than = FALSE)
#' ab_roundnice(x = x, dig = 3, numeric = TRUE, less_than = FALSE)
#' ab_roundnice(x = x, dig = 3, numeric = TRUE, less_than = TRUE)
ab_roundnice <- function(x, dig = 2, numeric = FALSE, less_than = FALSE) {

  res <- sprintf(fmt = paste0("%.", dig, "f"), round(x = x, digits = dig))

  if (less_than) {
    res <- stringr::str_replace(
      string      = res,
      pattern     = paste0("0.", paste0(rep("0", dig), collapse = "")),
      replacement = paste0("< 0.", paste0(rep("0", dig - 1), collapse = ""), "1")
    )
  }

  if (numeric & !less_than) {
    res <- as.numeric(res)
  }

  if (numeric & less_than) {
    warning("User selected both numeric and less_than options.\n The less_than option requires output to be of class character.\n Output returned is of class character.")
  }

  return(res)

}
