library(leaflet)
library(terra)
library(rgdal)
library(sf)
library(magrittr)
library(dplyr)
library(ggmap)
library(htmltools)
library(RSQLite)

addGeoJSON(map = map, geojson = "ports_50km_test.geojson", 
           layerId = NULL, 
           stroke = TRUE, 
           color = "red", 
           weight = 5, 
           opacity = 0.5, 
           fill = TRUE, 
           fillColor = "red", 
)

map <- leaflet() %>% 
   addProviderTiles(providers$Esri.OceanBasemap) %>% 
   setView(lng = -4.2026458, lat = 56.4906712, zoom = 5) %>% 
   addPolygons(data = "ports_50km_test.geojson")
map

map <- leaflet() %>% 
   addProviderTiles(providers$Esri.OceanBasemap) %>% 
   setView(lng = -4.2026458, lat = 56.4906712, zoom = 5) %>% 
   addGeoJSON(map = map, geojson = "Ports_100km_test.geojson", 
              layerId = NULL, 
              stroke = TRUE, 
              color = "red", 
              weight = 5, 
              opacity = 0.5, 
              fill = TRUE, 
              fillColor = "red", 
              )
map

map <- leaflet() %>% 
   addProviderTiles(providers$Stamen.Toner) %>% 
   setView(lng = -4.2026458, lat = 56.4906712, zoom = 5) %>% 
   addGeoJSON(map = map, geojson = "Ports_100km_test.geojson", 
              layerId = NULL, 
              stroke = TRUE, 
              color = "red", 
              weight = 5, 
              opacity = 0.5, 
              fill = TRUE, 
              fillColor = "red", 
   )
map