# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinyBS)
library(shinyLP)
library(shinythemes)

# Define UI for application
shinyUI(
  
  # Include a fliudPage above the navbar to incorporate a icon in the header
  # Source: http://stackoverflow.com/a/24764483
  fluidPage(
    
    list(tags$head(HTML('<link rel="icon", href="logo.png",
                        type="image/png" />'))),
    div(style="padding: 1px 0px; width: '100%'",
        titlePanel(
          title="", windowTitle="EHDEN Study Results"
        )
    ),
    
    navbarPage(title=div(img(src="avatar.png"), "EHDEN Data Repository"),
               inverse = F, # for diff color view
               theme = shinytheme("cerulean"),
               
               tabPanel("Home", icon = icon("home"),
                        
                        jumbotron("Welcome to the EHDEN Data Repository", "Here you can find all the web applications produced by EHDEN studies",
                                  buttonLabel = "Click Me"),
                        fluidRow(
                          column(6, panel_div(class_type = "primary", panel_title = "Directions",
                                              content = "How to use the app (ToDo)")),
                          column(6, panel_div("primary", "Application Maintainers",
                                              HTML("Email Me: <a href='mailto:enquiries@ehden.eu?Subject=Shiny%20Server%20Help' target='_top'>EHDEN Support</a>")))
                        ),  # end of fluidRow
                        fluidRow(
                          column(6, panel_div("primary", "App Status", "The Landing Page is currently under development")),
                          column(6, panel_div("primary", "Security and License", "Copyright 2020")),
                          
                          #### FAVICON TAGS SECTION ####
                          tags$head(tags$link(rel="shortcut icon", href="favicon.ico")),
                          
                          bsModal("modalExample", "Instructional Video", "tabBut", size = "large" ,
                                  p("Additional text and widgets can be added in these modal boxes. Video plays in chrome browser"),
                                  iframe(width = "560", height = "315", url_link = "https://www.youtube.com/embed/0fKg7e37bQE")
                          )
                          
                        )),
               tabPanel("Statistics", icon = icon("cog"),
                        wells(content = "Important Info can go up here before a
                              user starts exploring the application and its features",
                              size = "default"),
                        h1("Hello Visitors!", align = "center"),
                        hr(),
                        
                        list_group(div(list_item("Application Updates", badge_value = 27),
                                       list_item("User Updates", badge_value = 24)))
                        
                        
               ),
               
               tabPanel("Study-a-thons", icon = icon("calendar"),
                        fluidRow(
                          column(6, jumbotron(image = 'barcelona.png', "EHDEN Study-a-thons", "team work to perform high-impact disruptive research",
                                              button = FALSE)),
                          column(3, HTML("<img src='barcelona.png' width='400' height='300' alt='This is alternate text'></img>")),
                          column(3,    HTML("<img src='oxford.png' width='400' height='300' alt='This is alternate text'></img>"))
                                 
                        ),
                       
                        hr(),
                        fluidRow(
                          column(4, thumbnail_label(image = 'Rlogo.png', label = 'Effect Estimation in Rheumatoid Arthritis',
                                                    content = 'These research results are from a retrospective, real-world, 
                                                    observational study to estimate the population-level effects of conventional 
                                                    synthetic disease-modifying antirheumatic drugs among patients with rheumatoid arthritis. 
                                                    This web-based application provides an interactive platform to explore all analysis results 
                                                    enerated as part of this study, as a supplement to abstracts and a full manuscript currently 
                                                    in development for submission to scientific conferences and a peer-reviewed journal. 
                                                    During abstract and manuscript development and the subsequent review period, 
                                                    these results are considered under embargo and should not be disclosed 
                                                    without explicit permission and consent from the authors',
                                                    button_link = 'https://data.ohdsi.org/EhdenRaDmardsEstimation/', button_label = 'Click me')
                          ),
                          column(4, thumbnail_label(image = 'Rlogo.png', label = 'Movie Explorer',
                                                    content = 'Test application hosted on data.ehden.eu server',
                                                    button_link = 'http://data.ehden.eu/movie-explorer/', button_label = 'Click me')),
                          column(4, thumbnail_label(image = 'Rlogo.png', label = 'QueryLibrary',
                                                    content = 'Library containing many SQL queries on the OMOP-CDM',
                                                    button_link = 'https://data.ohdsi.org/QueryLibrary/', button_label = 'Click me'))
                          
                        )))
    
  ) # end of fluid page
) # end of shiny