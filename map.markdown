---
layout: default
title: Charlotte Smith Map
permalink: /map/
---
# About the Map
 
 This map was created for my third dissertation chapter on Charlotte Smith's poetry and place. I posit that the relationship between Smith’s apprehensions about contemporary social and political tensions that is evident in Beachy Head can be 1) applied to all her poetic works in (name editions) and 2) made visible through digital mapping methods.  The mapping process makes it possible to see how Smith uses geography to create distance between herself and the current political and social climate.  By using RStudio to generate a mapping visualization that plots possible geographic coordinates, I aim to illustrate how Smith’s poetic imagination engages in global and local locations in relationship to her thoughts on Great Britain’s imperial enterprises.  Due the geographic nature of Smith’s poetic canon, it’s necessary and illuminating to create a visualization of her works’ movements across England, Europe, and the globe in order to understand how her works engage with globalized Romanticism.  



# The Map






# The Code
This interactive map was made in RStudio with ggplot2, and Shiny. For technical details on how its created, please see my blog post. It is intended to illustrate how Charlotte Smith uses real, plottable locations in her poetry and her preoccupation with British imperialism.
```
library(ggplot2)
library(ggiraph)
library(shiny)

setwd("C:/Users/Drago/Documents/Holly's Files/Dissertation/Chapter 3/DH Materials")

df<-read.csv('Mapping_metadata.csv')

world <- map_data("world")

df$onclick <- sprintf("window.open(\"%s%s\")",
                      "https://github.com/HornerHolly/dissertation/tree/main/interactivemapfiles/", as.character(df$URL) )

p<-ggplot() +
  geom_map(
    data = world, map = world,
    aes(long, lat, map_id = region),
    color = "white", fill = "lightgray", size = 0.1
  ) +
  geom_point_interactive(
    data = df,
    aes(longitude, latitude, 
        color = Word,  tooltip = Word, data_id =  Word, onclick = onclick,
        size=Frequency),
    alpha = 0.5
  ) +
  theme_void() +
  theme(legend.position = "none")+
  #theme_void() +
  #theme(legend.position = "none")+
  labs(title="Charlotte Smith Poem Map",
       subtitle = "By Holly Horner"
  ) + 
  theme(plot.title = element_text(size = 12, face = "bold.italic", family = 'Palatino'),
        plot.subtitle = element_text( face = "italic", family = 'Palatino'))

girafe(ggobj = p)
```
