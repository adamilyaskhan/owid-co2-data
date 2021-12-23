# Load R packages
library(shiny)
library(shinythemes)
library(readxl)
library(ggplot2)

owid_co2_data <- read_excel("owid-co2-data.xlsx")


# Define UI
ui <- fluidPage(theme = shinytheme("yeti"),
                navbarPage(
                  # theme = "cerulean",  # <--- To use a theme, uncomment this
                  "OWID Emissions Data",
                  tabPanel("Per capita Co2 emmisions",
                           sidebarPanel(
                             tags$h3("Country"),
                    
                             selectInput("countries", "Select countries",
                                         c("United States", "China", "United Kingdom",
                                           "Japan", "France", "Germany", "Spain", 
                                           "Italy", "India", "Brazil", "Australia",
                                           "Argentina", "Chile", "Russia", "Mexico",
                                           "Canada", "Portugal", "Indonesia", "Pakistan"),
                                      
                                         multiple = TRUE)
                             
                             
                           ), # sidebarPanel
                           mainPanel(
          
                          
                             plotOutput("per_cap_plot")
                             
                           ) # mainPanel
                           
                  ), # Navbar 1, tabPanel
                  tabPanel("Carbon Intensity of GDP", sidebarPanel(
                    tags$h3("Country"),
                    
                    selectInput("countries_2", "Select countries",
                                c("United States", "China", "United Kingdom",
                                  "Japan", "France", "Germany", "Spain", 
                                  "Italy", "India", "Brazil", "Australia",
                                  "Argentina", "Chile", "Russia", "Mexico",
                                  "Canada", "Portugal", "Indonesia", "Pakistan"),
                                
                                multiple = TRUE)
                           ), mainPanel(
                             
                             
                             plotOutput("per_gdp_plot")),
                 
                  
                )) # navbarPage
) # fluidPage


# Define server function  
server <- function(input, output) {
  
  output$per_cap_plot <- renderPlot({ggplot(subset(owid_co2_data, country %in% input$countries ),
                                                            aes(x=year, y=co2_per_capita, group=country, col=country, fill=country))  +
    geom_line(size = 0.75) + labs(x="Year", y="tCO2 per capita") +theme_classic()
  
  })
  output$per_gdp_plot <- renderPlot({ggplot(subset(owid_co2_data, country %in% input$countries_2 ),
                                            aes(x=year, y=co2_per_gdp, group=country, col=country, fill=country))  +
      geom_line(size = 0.75) + labs(x="Year", y="kgCO2e per $") +theme_classic()})
    
} # server


# Create Shiny object
shinyApp(ui = ui, server = server)

