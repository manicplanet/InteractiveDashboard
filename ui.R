# Load libraries
library(shiny)
library(tidyverse)

# Application Layout
shinyUI(
  fluidPage(
    br(),
    # TASK 1: Application title
    titlePanel("Title Here"),
    p("Explore the difference between people who earn less than 50K and more than 50K. You can filter the data by country, then explore various demogrphic information."),
    
    # TASK 2: Add first fluidRow to select input for country
    fluidRow(
      column(12, 
             wellPanel(selectInput(inputid = "country", label = "country",choices = c("United-States", "Canada", "Mexico", "Germany", "Philippines"))) #country
             )
    ),
    #
    # TASK 3: Add second fluidRow to control how to plot the continuous variables
    fluidRow(
      column(3, 
             wellPanel(
               p("Select a continuous variable and graph type (histogram or boxplot) to view on the right."),
               radioButtons(continuous_variable, label = "Continuous Variable", choices = c("age","hours_per_week")),
               radioButtons(graph_type, label = "Graph Type", choices = c("histogram","boxplot"))
               )
             ),
      column(9, plotOutput("p1"))  # p1
    ),
    
    # TASK 4: Add third fluidRow to control how to plot the categorical variables
    fluidRow(
      column(3, 
             wellPanel(
               p("Select a categorical variable to view bar chart on the right. Use the check box to view a stacked bar chart to combine the income levels into one graph. "),
               radioButtons(inputid = "categorical_variable", label = "Demographic", choices = c("education", "workclass", "sex")
               ),    
               checkboxInput(is_stacked),     # if the bars "is_stacked" (input ID), that is, if the checkbox is checked then the bars will be stacked. Otherwise, they will be faceted and unstacked. Add a label. The initial value can be either FALSE or TRUE. 
               )
             ),
      column(9,  plotOutput("p2"))  # 
    )
  )
)
