library(shiny)
library(car)
library(ggplot2)
diamondsData <- diamonds

shinyServer(function(input, output) {
    
    formulaText <- reactive({
        paste("price ~",input$variable)
    })
    
    formulaTextPoint <- reactive({
        paste("price ~", "as.integer(", input$variable, ")")
    })
    
    fit <- reactive({
        lm(as.formula(formulaTextPoint()), data=diamondsData)
    })
    
    output$caption <- renderText({
        formulaText()
    })
    
    output$mpgPlot_1 <- renderPlot({
        boxplot(as.formula(formulaText()), 
                data = diamondsData,
                outline = input$outliers)
    })
    
    output$fit <- renderPrint({
        summary(fit())
    })
    
    output$mpgPlot <- renderPlot({
        with(diamondsData, {
            plot(as.formula(formulaTextPoint()))
            abline(fit(), col=2)
        })
    })
    
})
