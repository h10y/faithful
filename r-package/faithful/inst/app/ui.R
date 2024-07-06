app_ui <- fixedPage(
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
