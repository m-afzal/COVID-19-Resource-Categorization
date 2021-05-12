#####################################################################
#         Loading Publication Data                                  #                                                    
#          Generating Venn Diagram                                  #
#                                                                   #              
#                                                                   #
#                                                                   #
#####################################################################

library(VennDiagram)
library(stringr)
library(RColorBrewer)

#-------------------------------
# A) Loading Publication Data  |
#-------------------------------

# i) Setting path to the folder of data file
setwd("./")

# ii) Loading data into data frame
dfPubData <- data.frame(read.csv(file = "PublicationData2020.csv", sep = ",", header = TRUE, stringsAsFactors = TRUE))

lstUniPulisher <- c()
lstUniPulisher <- unlist(lapply(levels(dfPubData$source_x), function(pGrp){
                           str_split(pGrp,";")
                         }))
lstUniPulisher <- str_trim(lstUniPulisher)
lstUniPulisher <- union(lstUniPulisher,lstUniPulisher)

lstPublisherPaper <- lapply(lstUniPulisher, function(p){
  dfPubData$url[str_detect(dfPubData$source_x,p)]
})



myCol <- brewer.pal(7, "Pastel2")

# Chart
venn.diagram(
  x = list(lstPublisherPaper[[1]], lstPublisherPaper[[2]], lstPublisherPaper[[3]],
           lstPublisherPaper[[4]], lstPublisherPaper[[5]]),
  category.names = c(lstUniPulisher[1],lstUniPulisher[2], lstUniPulisher[3],
                     lstUniPulisher[4], lstUniPulisher[5]),
  filename = '#14_venn_diagramm.png',
  output=TRUE,
  
  
 
)



##############################
# Output features

