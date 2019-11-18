library(shiny)
library(plotly)
library(reshape2)

# Define server logic required to plot various variables against mpg
shinyServer(function(input, output) {

  #Reading in the CCLE data here
  load("data/geneEffect.RData")
  #chrmGenes<-melt(geneEffect[,c("X","PHC2","PHC3","PHF19","PCGF1","PCGF2","PCGF5","PCGF6","CSNK2A1","CSNK2B","SIRT1","CBX6","CBX2","CBX4","CBX8","PHF1","PCGF3","BAP1","UBAP2L","ASXL1","DNMT3L","PHC1","ZFP42","ASXL3","RING1","HDAC2","BMI1","TRIM37","YY1","SKP1","KDM2B")])


  # Compute the forumla text in a reactive expression since it is 
  # shared by the output$caption and output$mpgPlot expressions
  formulaText <- reactive({
    paste("Gene effect scores ~", input$variable)
  })

  # Return the formula text for printing as a caption
  output$caption <- renderText({
    formulaText()
  })

  #grab the group name to highlight
  geneList<- reactive({
	  chrmGenes<-as.data.frame(melt(geneEffect[,as.vector(strsplit(paste("X", input$geneList), '\\s+')[[1]])]))
  })
  output$genes <- renderTable({
	geneList()
  })

  #Working plot which prints the Achilles data in the gene effect plot
  output$achilles<- renderPlotly({
    ggplotly(ggplot(geneList(),aes(value,variable),name=X)+geom_point(alpha=0.1))
  })
})
