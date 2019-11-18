library(shiny)
items <- lapply(1:20, function(x) paste0("group", x))
itemNames<-lapply(1:20,function(x) paste0("Group",x))
names(items)<-itemNames

# Define UI 
shinyUI(pageWithSidebar(

  # Application title
  headerPanel("Gene Dependancies on Histone Clusting"),

  # Sidebarpanel
  sidebarPanel(
    selectInput("cluster", "Select Group:",
		choices=items),

    textInput("geneList", h3("Enter Genes:"),
		value = "JARID2 RNF2 AEBP2 SIN3A LCOR LCORL C10orf12 EZH2 EZH1 EED SUZ12 RBBP4"),
  ),

  # Show the caption and plot of the requested variable against mpg
  mainPanel(
    h3(textOutput("caption")),

    plotlyOutput("achilles")
  )
))
