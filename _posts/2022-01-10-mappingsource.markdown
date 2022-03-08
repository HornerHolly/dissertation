---
layout: post
title:  "Final Mapping Methods"
date:   2021-01-10 12:21:16 -0500
---

*January 10th, 2022*

# Mapping Source Code for Chapters 2 and 3

This is the final mapping source code for Chapters 2 and 3.
```
library(shiny)
library(leaflet)
library(dplyr)
df<-read.csv(‘https://raw.githubusercontent.com/HornerHolly/dissertation/main/Csvfiles/Smith_%20Mapping_metadata.csv’)
df <- df[order(df$Word, df$Place),]
ui <- bootstrapPage(
 tags$style(type = “text/css”, “html, body {width:100%;height:100%}”),
 leafletOutput(“map”, width = “100%”, height = “100%”),
 absolutePanel(top = 10, right = 10,
        selectInput(“Word”,”Select word:”,selected = ““,choices = unique(df$Word)
        ),       
 )
)
server <- function(input, output, session) {
 # Reactive expression for the data subsetted to what the user selected
 filteredData <- reactive({
  filter(df, Word == input$Word)
 })
 output$map <- renderLeaflet({
  # Use leaflet() here, and only include aspects of the map that
  # won’t need to change dynamically (at least, not unless the
  # entire map is being torn down and recreated).
  leaflet(df) %>% addTiles() %>%
   fitBounds(~min(longitude), ~min(latitude), ~max(longitude), ~max(latitude))
 })
 
 # Incremental changes to the map (in this case, replacing the
 # circles when a new color is chosen) should be performed in
 # an observer. Each independent set of things that can change
 # should be managed in its own observer.
 observe({
  leafletProxy(“map”, data = filteredData()) %>%
   clearShapes() %>%
   addMarkers()
 })
}
shinyApp(ui, server)


```
