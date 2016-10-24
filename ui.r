library(shiny)

shinyUI(
  navbarPage("Shiny Stocks 1.0",  collapsible = TRUE, 
        
             # Create Tab for the main App
             tabPanel("Stocks",
                      
                      fluidPage(theme ="slate.css",
                      
                        
                        # Sidebar with inputs for quantmod graphing capabilities
                        sidebarLayout(
                          sidebarPanel(
                            h4("Enter a stock symbol to examine. Data is provided from yahoo finance."),
                            textInput("stock", "", value = "FB", width = "20%"),
                            
                            br(),
                            dateRangeInput("dtRange", "Choose your Date Range", start = Sys.Date()-90, end = NULL, min = NULL, max = NULL, format = "yyyy-mm-dd", startview = "month", weekstart = 0, language = "en", separator = " to ", width = NULL),
                            hr(),
                            actionButton("get3months", "3 months"),
                            actionButton("get6months", "6 months"),
                            actionButton("get1year", "1 year"),
                            actionButton("get3year", "3 year"),
                            actionButton("get5year", "5 year"),
                           
                            br(),
                            hr(),
                           a("Symbol Lookup", href="http://finance.yahoo.com/lookup", target="_blank"),
                           p("*opens a new windows")
                          ),
                          # Show the stock chart
                          mainPanel(
                            plotOutput("StockPlot", height="800px")
                            
                          )
                        )
                      )
             ),
             tabPanel("Settings",
                      fluidPage(
                        verticalLayout(
                          h2("Chart Settings"),
                          p("Click the checkbox to modify the current chart"),
                            #Add techical features to the chart when choosen from the settings.
                            checkboxGroupInput("overlays", "Add Optional Technical Analysis Overlays:",
                                               c("Average True Range" = "addATR()",
                                                 "Bollenger Bands" = "addBBands()",
                                                 "Commodity Channel Index" = "addCCI()",
                                                 "Chaiken Money Flow" = "addCMF()",
                                                 "Chande Momentum Oscillator" = "addCMO()",
                                                 "Contract Expiration Bars" = "addExpiry()",
                                                 "De-trended Price Oscillator" = "addDPO()",
                                                 "Directional Movement Index" = "addADX()",
                                                 "Double Expotential Moving Average" = "addDEMA()",
                                                 "Expotential Moving Average" = "addEMA()", 
                                                 "Expotential Volume Weighted Moving Average" = "addEVWMA()", 
                                                 "Moving Average to Chart" = "addEVWMA(n = 10, on = 1, with.col = Cl, overlay = TRUE, col = 'yellow')",
                                                 "Moving Average Convergence Divergence" = "addMACD()",
                                                 "Rate of Change" = "addROC()",
                                                  "Relative Strength Index" = "addRSI()",
                                                 "Simple Moving Average" = "addSMA()",
                                                 "Stochastic Momemtum Indicator" = "addSMI()",
                                                 "Price Envelope" = "addEnvelope()",
                                                 "Parabolic Stop and Reversal Indicator" = "addSAR()",
                                                 "Weighted Moving Average" = "addWMA()",
                                                 "ZLEMA" = "addZLEMA()"
                                           
                                                 
                                                 
                                               ))
                            
                          )
                        )
                            
                      
                      ),
             tabPanel("About",
                      fluidPage(
                        verticalLayout(
                          h2("How to use Shiny Stocks 1.0", align="center"),
                          hr(),
                          h3("How to Guide"),
                          p("Shiny Stocks loads a default Facebook stock data. To choose another stock symbol simply enter the stock symbol in the symbol field. If your stock symbol is not valid - no graph will display"),
                          p("Use the Symbol Lookup link to find a valid symbol. This will open the yahoo finance symbol webpage in a new window."),
                          p("Interactive Areas"),
                          tags$ul(tags$li("Date Range - you can specify a specific date range and the chart will rechart. You can also pick 1 month, 3 months, 1 year, 3 years, 5 years from quick buttons"),
                          tags$li("Change the chart with Technical Analysis Overlays located on the Settings tab. Some of the technical overlays require 3 months worth of data to work properly. Just check the overlays you with to add to the chart.")),
                          hr(),
                          h3("The project was developed for the Coursera Developing Data Products course."),
                          p("Some code used in this Shiny Stocks is based on the Shiny quantmod tutorial."), 
                          a("Source Shiny quantmod tutorial", href="http://shiny.rstudio.com/tutorial/lesson6/", target="_blank"),
                       
                          a("Quantmod Reference Guide", href="https://cran.r-project.org/web/packages/quantmod/quantmod.pdf", target="_blank")
                           )
                      )
             )
  )
)