

library(shiny)
shinyUI(
  pageWithSidebar(
    headerPanel("For How much I can sell my car?"),  
    sidebarPanel(
      numericInput('year','Year of the Car',2006,min = 2006,max = 2015,step = 1) ,
      sliderInput('kms','Kilometers of the Car',60000,min = 0,max = 300000,step = 1000),
      radioButtons('aa','Have Air Conditioning or Heating?',c("Yes"=1,"No"=0))
    ),
    mainPanel(
      h3('Wondering for how much you can get for your car? '),
      p('Change the params on the side panel according to the attributes
        of your car and you can get a estimated for how much you can sell it. '),
      h3('Price interval estimated [min price - max price]'),
      verbatimTextOutput("prediction") 
    )
  )  
)









