library(shiny)
library(plotly)
library(reshape2)

# Define server logic 
shinyServer(function(input, output) {

  #Reading in the CCLE data here
  load("data/geneEffect.RData")

  # Compute the forumla text in a reactive expression 
  formulaText <- reactive({
    paste("Gene effect scores ~", input$cluster)
  })

  # Return the formula text for printing as a caption
  output$caption <- renderText({
    formulaText()
  })

  #grab the genes to plot 
  geneList<- reactive({
	  as.data.frame(melt(geneEffect[,as.vector(strsplit(paste("X", input$geneList), '\\s+')[[1]])]))
  })

  groupList<- reactive({
	  read.table()
  })

  #Working plot which prints the Achilles data in the gene effect plot
  output$achilles<- renderPlotly({
    ggplotly(ggplot(geneList(),aes(value,variable,name=X))+
	     geom_vline(xintercept=0)+geom_vline(xintercept=-0.5,linetype="dashed")+
	     theme_bw()+theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank())+
	     xlab("Effect Score")+ylab("Gene") +geom_point(alpha=0.3))
  })
})
