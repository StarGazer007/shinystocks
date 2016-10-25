---
title       : Shiny Stocks 1.0
subtitle    : Coursera & Johns Hopkins University - Developing Data Project
author      : Lisa Rodgers
job         : Future Data Scientist
framework   : io2012       # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : [bootstrap]  # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
output: html_document
---

 

<style  type="text/css">
.title-slide {
  background-color: #187daf; /* #EDE0CF; ; #CA9F9D*/
  background-image: url(assets/bg.jpg)

}

 .col2 {
    columns: 2 300px;         /* number of columns and width in pixels*/
    -webkit-columns: 2 300px; /* chrome, safari */
    -moz-columns: 2 300px;    /* firefox */
  }
  .col3 {
    columns: 3 100px;
    -webkit-columns: 3 100px;
    -moz-columns: 3 100px;
  }
  
</style>

## Project Overview

This app was built as part of a deliverable for the course Developing Data Products as part of the Coursera Data Science Specialization.

The app developed for the assignment is avalilable at: 
<br/>
[Shiny Stocks](https://stargazerdata.shinyapps.io/Shiny_Stocks/)


Source code for ui.R and server.R files are available on the GitHub repo: 
<br/>
[Lisa Rodgers (StarGazer007) Github Repo](https://github.com/StarGazer007/shinystocks)

How to use quantmod package:
<br/>
[Cran Quantmod Guide](https://cran.r-project.org/web/packages/quantmod/quantmod.pdf)



--- bg:url(assets/slide1.jpg) 

## Project Deliverables 

This peer assessed assignment has two parts. First, you will create a Shiny application and deploy it on Rstudio's servers. Second, you will use Slidify or Rstudio Presenter to prepare a reproducible pitch presentation about your application.

### Your Shiny Application
<hr/>
* Write a shiny application with associated supporting documentation. 
* The documentation should be thought of as whatever a user will need to get started using your application.

* Deploy the application on Rstudio's shiny server
* Share the application link by pasting it into the provided text box
* Share your server.R and ui.R code on github



--- bg:url(assets/slide2.jpg) 
## The Application

The Shiny Stock application uses the package quantmod. QuantMod is a Quantitative Financial Modelling Framework to Specify, build, trade, and analyse quantitative financial trading strategies. A user can enter a stock symbol in the symbol field and choose a required data range and a chart of stock data will be rendered reactively. Additionally the user may pick from some quick data ranges (1 month, 3 months, 1 year, 3 years, 5 years) by pressing the apporiate buttons.

The user may also take advantage of some valuable finacial overlays by accessing the settings tab and clicking the checkboxes that apply.

[Package Link](https://cran.r-project.org/web/packages/quantmod/)



--- bg:url(assets/slide2.jpg) 
## Source Code

Code to render the stock chart. Source code for ui.R and server.R files are available on the GitHub repo: 
<br/>
[Lisa Rodgers (StarGazer007) Github Repo](https://github.com/StarGazer007/shinystocks)


```r
  output$StockPlot <- renderPlot({
    overlaysStr<-"addVo()"
    if (!is.null(input$overlays)) {
      for (overlays in input$overlays) {
        overlaysStr<-paste( overlaysStr, paste(";", overlays))
      }
    }
    
    if(!is.null(Stock())) {
      chartSeries(Stock(), 
                  name=input$stock,type="candlesticks", 
                  TA= overlaysStr, 
                  theme=chartTheme("black")
                  )
    }
  })
```

--- bg:url(assets/animatebg.gif) 
## About the Author
Lisa is a traveling coffee aficionado, internet fanatic, 2012 survivor, with a thirst for knowledge. She is currently studying to be a Data Scientist at Johns Hopkin University. 

<div class="col2">

<img src="assets/lisarodgers.jpg" width="275">
<p>@star_gazer72</p>

<a href="http://lisa.rodgers.space">lisa.rodgers.space</a>
<br/><br/><br/>

<h2>Social Media</h2>
<ul class="social">
<li><a href="https://www.facebook.com/stargazer01"><img src="assets/facebook.png" ></a></li>
<li><a href="https://twitter.com/star_gazer72"><img src="assets/twitter.png"></a> </li>

<li><a href="https://github.com/StarGazer007"><img src="assets/github.png" ></a></li>
</div>



