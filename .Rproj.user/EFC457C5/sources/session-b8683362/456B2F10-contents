#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(leaflet)
library(rgdal)
library(dplyr)
library(RColorBrewer)

wave_data <- read_sf("~/Desktop/r/WES_report_test/Leaflet_wave_data/Wave_data/Wave_data_32631.geojson")

wave_data <- st_transform(wave_data, crs = '+proj=longlat +datum=WGS84')

## Load map

wave_data_map <- leaflet() %>% 
   addProviderTiles(providers$Esri.WorldTopoMap) %>% 
   setView(lng = -4.2026458, lat = 56.4906712, zoom = 5)
wave_data_map

## Add polygons

wave_data_map <- leaflet() %>% 
   addProviderTiles(providers$Esri.WorldTopoMap) %>% 
   setView(lng = -4.2026458, lat = 56.4906712, zoom = 5) %>% 
   addPolygons(data = wave_data, color = "blue", stroke = 1, opacity = 0.5
   )
wave_data_map

# bins <- c(0-25, 25-50, 50-100, 100-150, 150-200)
# pal <- colorBin("RdYlBu", domain = wave_data$Ave_Depth, bins = bins)

# Define UI for application
ui <- bootstrapPage(
   tags$style(type = "text/css", "html, body {width:100%;height:100%}"),
   leafletOutput("wave_data_map", width = "100%", height = "100%"),
   absolutePanel(top = 10, right = 10, 
                 sliderInput("range", "Wave energy", min(wave_data$An_mn_P_OD), max = 60, 
                             value = range(wave_data$An_mn_P_OD), step = 5
                             ),
                 sliderInput("range", "Average Depth", min = 0, max = 200, 
                             value = range(wave_data$Ave_Depth), step = 50)
                 )
   )
    

# Define server logic

server <- function(input, output) {
   filteredData <- reactive({
      wave_data[wave_data$An_mn_P_OD >= input$range[1] & wave_data$An_mn_P_OD <= input$range[2],]
   })
   output$wave_data_map <- renderLeaflet({
      leaflet(wave_data) %>% 
         addProviderTiles(providers$Esri.WorldTopoMap) %>% 
         setView(lng = -4.2026458, lat = 56.4906712, zoom = 5)
         addPolygons(data = wave_data, color = "blue", stroke = 1, opacity = 0.5
      )
   })
}

# Run the application 
shinyApp(ui = ui, server = server)
