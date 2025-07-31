#' Calculate Fiscal Year based on date and fiscal year start month
#'
#' @param date Date or character string that can be converted to a Date
#' @param fy_start_month Numeric month (1-12) when fiscal year starts (default is 10 for October)
#' @return Numeric fiscal year
#' @examples
#' # October fiscal year (default)
#' calculate_fiscal_year("2025-09-30") # returns 2025
#' calculate_fiscal_year("2025-10-01") # returns 2026
#'
#' # July fiscal year
#' calculate_fiscal_year("2025-06-30", fy_start_month = 7) # returns 2025
#' calculate_fiscal_year("2025-07-01", fy_start_month = 7) # returns 2026
calculate_fiscal_year <- function(date, fy_start_month = 10) {
  # Input validation
  if (!is.numeric(fy_start_month) ||
      fy_start_month < 1 ||
      fy_start_month > 12) {
    stop("fy_start_month must be a number between 1 and 12")
  }

  # Convert input to Date type if it's not already
  date <- as.Date(date)

  # Extract year and month
  year <- lubridate::year(date)
  month <- lubridate::month(date)

  # Determine fiscal year
  if (month >= fy_start_month) {
    fiscal_year <- year + 1
  } else {
    fiscal_year <- year
  }

  return(fiscal_year)
}
