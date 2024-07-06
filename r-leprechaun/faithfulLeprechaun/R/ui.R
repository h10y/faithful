#' Shiny UI
#'
#' Core UI of package.
#'
#' @param req The request object.
#'
#' @import shiny
#' @importFrom bslib bs_theme
#'
#' @keywords internal
ui <- function(req) {
  fixedPage(
    title = "Old Faithful",
    h2("Old Faithful"),
    plotOutput(outputId = "histogram"),
    sliderInput(
      inputId = "n",
      label = "Number of bins:",
      min = 1,
      max = 50,
      value = 25,
      ticks = TRUE
    )
  )
}

#' Assets
#'
#' Includes all assets.
#' This is a convenience function that wraps
#' [serveAssets] and allows easily adding additional
#' remote dependencies (e.g.: CDN) should there be any.
#'
#' @importFrom shiny tags
#'
#' @keywords internal
assets <- function() {
  list(
    serveAssets(), # base assets (assets.R)
    tags$head(
      # Place any additional depdendencies here
      # e.g.: CDN
    )
  )
}
