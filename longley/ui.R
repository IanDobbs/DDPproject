library(shiny)

shinyUI(fluidPage(
    titlePanel("Predict Unemployment from Population"),
    sidebarLayout(
        sidebarPanel(
            sliderInput("sliderPOP", "Population Size:", 100, 130, value = 110),
            checkboxInput("showModel", "Show/Hide Model", value = TRUE)
        ),
        mainPanel(
            tabsetPanel(type = "tab", 
                        tabPanel("Results", plotOutput("plot"),
                                 h4("Selected Population size:"),
                                 tableOutput("values"),
                                 h4("Predicted number of unemployed for selected population size:"),
                                 textOutput("pred")),
                        tabPanel("Documentation",
                                 h4("How to use this application"),
                                 
                                 tags$ul(
                                     tags$li("The default population size is 110M"), 
                                     tags$li("Use the slider to select a population size between 100-130M"), 
                                     tags$li("Check/uncheck the check box to show/hide the model on the display plot"),
                                     tags$li("The Results tab will display a plot, and text output, of the results")
                                 )))
            
            
        )
    )
))