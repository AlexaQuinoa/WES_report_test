
# Library ----
library(leaflet)
library(terra)
library(rgdal)
library(sf)
library(magrittr)
library(dplyr)
library(ggmap)
library(htmltools)
library(RSQLite)
library(leaflet.providers)
library(mapview)
library(htmlwidgets)
library(pandoc)

# Load ----

data_test <- read_sf("Ports_100km_test.geojson")


# Set projection ----

data_test <- st_transform(data_test, crs = '+proj=longlat +datum=WGS84')


# data_test2 <- read_sf("zss/100kmPorts_wave<100m_>20kW:m_protected.gpkg")

# data_test2 <- st_transform(data_test2, crs = '+proj=longlat +datum=WGS84')

# Load map ----

map <- leaflet() %>% 
   addProviderTiles(providers$Esri.WorldTopoMap) %>% 
   setView(lng = -4.2026458, lat = 56.4906712, zoom = 5)
map

# Add polygons

map <- leaflet() %>% 
   addProviderTiles(providers$Esri.WorldTopoMap) %>% 
   setView(lng = -4.2026458, lat = 56.4906712, zoom = 5) %>% 
   addPolygons(data = data_test, color = "blue", stroke = 10, opacity = 0.5
   )
map

# mapshot(map, file = "static_map.png")

saveWidget(map, file = "dynamic_map.html")


