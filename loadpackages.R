# R Shiny tutorial
# google doc: https://docs.google.com/document/d/1RGRQ0GJIrEvwiPdS3nzJTx8GjN5XhI0w-pyGW5w7YYc/edit

install.packages("shiny")
install.packages("shinythemes")

library(shiny); library(shinythemes); library(tidyverse)
runExample("01_hello")


# Attach necessary packages
library(tidyverse)
library(shiny)
library(shinythemes)

setwd("C:/Users/Ellie/Dropbox/elli.jenkins@gmail/UW.2010-present/2.EducationResearch/MetaAnalysis/Gaps2.0/tutorial")

spooky <- read_csv("spooky_data.csv")

# Create the user interface:
ui <- fluidPage(
  theme = shinytheme("slate"),
  titlePanel("I am adding a title!"),
  sidebarLayout(
    sidebarPanel("put my widgets here",
                 selectInput(inputId = "state_select",
                             label = "Choose a state:",
                             choices = unique(spooky$state)
                 ),
                 radioButtons(inputId = "region_select",
                              label = "Choose region:",
                              choices = unique(spooky$region_us_census))
    ),
    mainPanel("put my outputs here",
              p("State's top candies:"),
              tableOutput(outputId = "candy_table"),
              p("Region's top costumes:"),
              plotOutput(outputId = "costume_graph")
    )
  )
)

# create the server function
server <- function(input, output) {
  
  state_candy <- reactive({
    spooky %>%
      filter(state == input$state_select) %>%
      select(candy, pounds_candy_sold)
  })
  
  output$candy_table <- renderTable({
    state_candy()
  })
  
  region_costume <- reactive({
    spooky %>%
      filter(region_us_census == input$region_select) %>%
      count(costume, rank)
  })
  
  
  output$costume_graph <- renderPlot({
    ggplot(region_costume(), aes(x = costume, y = n)) +
      geom_col(aes(fill = rank)) +
      coord_flip() +
      scale_fill_manual(values = c("black","purple","orange")) +
      theme_minimal()
  })
}


# Combine them into an app:
shinyApp(ui = ui, server = server)











setwd("C:/Users/Ellie/Dropbox/elli.jenkins@gmail/UW.2010-present/2.EducationResearch/MetaAnalysis/Gaps2.0")

dat <- read.csv("spooky_data.csv", head=T)