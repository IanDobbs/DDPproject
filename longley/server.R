library(shiny)

data(longley)

shinyServer(function(input, output) {

    model <- lm(Unemployed ~ Population, longley)
    
    modelpred <- reactive({
        popInput <- input$sliderPOP
        predict(model, newdata = data.frame(Population = popInput))
    })
    
     output$plot <- renderPlot({
        popInput <- input$sliderPOP
        
        plot(longley$Population, longley$Unemployed, xlab = "Population (000's)", 
             ylab = "Unemployment", bty = "n", pch = 16,
             xlim = c(100, 140), ylim = c(180, 500))
        title(main = "Unemployment Prediction Model",
              sub = "data source: data(longley)")
        
        if(input$showModel){
            abline(model, col = "red", lwd = 2)
        }
        legend(128, 300, "Model Prediction", pch = 16, 
               col = "red", bty = "n", cex = 1.2)
        points(popInput, modelpred(), col = "red", pch = 16, cex = 2)
    
    })
    output$pred <- renderText({
        modelpred()
    })
        # Reactive expression to create data frame of slider input values
        sliderValues <- reactive({
            
            data.frame(
                "Value" = as.character(input$sliderPOP),
                stringsAsFactors = FALSE)
            
        })
        
        # Show the slider value in an HTML table
        output$values <- renderTable({
            sliderValues()
        })
     
})