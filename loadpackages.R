# R Shiny tutorial

install.packages("shiny")
install.packages("shinythemes")

library(shiny); library(shinythemes); library(tidyverse)
runExample("01_hello")


# Attach necessary packages
library(tidyverse)
library(shiny)
library(shinythemes)

# Create the user interface:
ui <- fluidPage()

# Create the server function:
server <- function(input, output) {}

# Combine them into an app:
shinyApp(ui = ui, server = server)




setwd("C:/Users/Ellie/Dropbox/elli.jenkins@gmail/UW.2010-present/2.EducationResearch/MetaAnalysis/Gaps2.0")

dat <- read.csv("spooky_data.csv", head=T)