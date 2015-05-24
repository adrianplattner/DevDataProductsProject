cars <- read.csv('cars.csv',stringsAsFactor=FALSE)

cars$price <- as.numeric(gsub("[^0-9]","",cars$price))
cars$kms <- as.numeric(gsub("[^0-9]","",cars$kms))
cars$aa <- as.factor(ifelse(grepl("Aa",cars$name),1,0))

model <- lm(price ~ year + kms + aa,data=cars)

shinyServer(
  function(input,output){
    predicting <- reactive({
      interval <-predict(model,newdata=data.frame(year=input$year,kms=input$kms,aa=input$aa),interval="predict")
      paste("col $ ",paste(format(interval[2],small.interval = 0,big.mark = ","),
            format(interval[3],small.interval = 0,big.mark = ","),sep=" - ")
      )    
    })
    output$prediction <- renderPrint({predicting()})
  }  
)

