library(shiny)

# Define UI for miles per gallon application
shinyUI(pageWithSidebar(

  # Application title
  headerPanel("Gene Dependancies on Histone Clusting"),

  # Sidebar with controls to select the variable to plot against mpg
  # and to specify whether outliers should be included
  sidebarPanel(
    selectInput("variable", "Select Group:",
                list("Group1" = "group1", 
                     "Group2" = "group2", 
                     "Group3" = "group3",
                     "Group4" = "group4",
                     "Group5" = "group5",
                     "Group6" = "group6",
                     "Group7" = "group7",
                     "Group8" = "group8",
                     "Group9" = "group9",
                     "Group10" = "group10",
                     "Group11" = "group11",
                     "Group12" = "group12",
                     "Group13" = "group13",
                     "Group14" = "group14",
                     "Group15" = "group15",
                     "Group16" = "group16",
                     "Group17" = "group17",
                     "Group18" = "group18",
                     "Group19" = "group19",
                     "Group20" = "group20")),

    textInput("geneList", h3("Enter Genes:"),
		value = "PHC2 PHC3 AEBP2"),
  ),

  # Show the caption and plot of the requested variable against mpg
  mainPanel(
    h3(textOutput("caption")),

  #  tableOutput("genes"),

    plotlyOutput("achilles")
  )
))
