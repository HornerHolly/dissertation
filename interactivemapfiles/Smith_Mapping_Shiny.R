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