library(shiny)
library(shinydashboard)
library(dashboardthemes)
library(tidyverse)

lapply(list.files("modules", full.names = TRUE), source)
