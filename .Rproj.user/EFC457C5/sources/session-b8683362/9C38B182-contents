library(leaflet)
library(rgdal)
library(sf)
library(magrittr)
library(dplyr)
library(htmltools)
library(RSQLite)
library(leaflet.providers)
library(mapview)
library(htmlwidgets)
library(pandoc)
library(maps)
library(shiny)
library(lubridate)
library(tidyverse)

## Load

wave_data <- read_sf("~/Desktop/r/WES_report_test/Leaflet_wave_data/Wave_data/Wave_data_32631.geojson")

wave_data

## Set projection

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





