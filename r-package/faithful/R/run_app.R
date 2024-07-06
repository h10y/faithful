#' Run the Shiny App
#'
#' @param ... Arguments passed to `shiny::runApp()`.
#' @export
run_app <- function(...) {
  shiny::runApp(system.file("app", package = "faithful"), ...)
}
