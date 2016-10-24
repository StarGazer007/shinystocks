library(shiny)
library(quantmod)
options("getSymbols.warning4.0"=FALSE)

shinyServer(function(input, output,session) {
  
  Stock <- reactive({
    tryCatch({
      suppressWarnings(getSymbols(input$stock, from=input$dtRange[1], to=input$dtRange[2],
                                  auto.assign = FALSE))
    }, error = function(err) {
      return(NULL)
    })
  })
  
  #change the date input to 3 months from todays date 
  observeEvent(input$get3months, {
    updateDateRangeInput(session,"dtRange",start = Sys.Date()-90, end = Sys.Date())
  })
  
  #change the date input to 6 months from todays date 
  observeEvent(input$get6months, {
    updateDateRangeInput(session,"dtRange",start = Sys.Date()-120, end = Sys.Date())
  })
  #change the date input to 1 year from todays date 
  observeEvent(input$get1year, {
    updateDateRangeInput(session,"dtRange",start = Sys.Date()-365, end = Sys.Date())
  })
  #change the date input to 3 years months from todays date 
  observeEvent(input$get3year, {
    updateDateRangeInput(session,"dtRange",start = Sys.Date()-1095, end = Sys.Date())
  })
  #change the date input to 5 years from todays date 
  observeEvent(input$get5year, {
    updateDateRangeInput(session,"dtRange",start = Sys.Date()-1825, end = Sys.Date())
  })
  output$StockPlot <- renderPlot({
    overlaysStr<-"addVo()"
    if (!is.null(input$overlays)) {
      for (overlays in input$overlays) {
        overlaysStr<-paste( overlaysStr, paste(";", overlays))
      }
    }
    
    if(!is.null(Stock())) {
      chartSeries(Stock(), name=input$stock,type="candlesticks", TA= overlaysStr, theme=chartTheme("black"))
    }
  })
  
  output$stockPrint <- renderPrint({
    print(Stock())
  })
})