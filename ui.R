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
               theme = shinytheme("darkly"),
               
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
                        
                        jumbotron("Hello shinyLP!", "Dock Several Applications on a page as a portal",
                                  button = FALSE),
                        hr(),
                        fluidRow(
                          column(4, thumbnail_label(image = 'Rlogo.png', label = 'Application 1',
                                                    content = 'Havana brown cornish rex bombay but bombay,
                                              but havana brown devonshire rex and devonshire rex.
                                              Tomcat egyptian mau. Cornish rex sphynx sphynx yet
                                              cougar and panther. Panther siberian. Lynx munchkin
                                              american shorthair. Norwegian forest. ',
                                                    button_link = 'http://getbootstrap.com/', button_label = 'Click me')
                          ),
                          column(4, thumbnail_label(image = 'Rlogo.png', label = 'Application 2',
                                                    content = 'Havana brown cornish rex bombay but bombay,
                                                    but havana brown devonshire rex and devonshire rex.
                                                    Tomcat egyptian mau. Cornish rex sphynx sphynx yet
                                                    cougar and panther. Panther siberian. Lynx munchkin
                                                    american shorthair. Norwegian forest. ',
                                                    button_link = 'http://getbootstrap.com/', button_label = 'Click me')),
                          column(4, thumbnail_label(image = 'Rlogo.png', label = 'Application 3',
                                                    content = 'Havana brown cornish rex bombay but bombay,
                                                    but havana brown devonshire rex and devonshire rex.
                                                    Tomcat egyptian mau. Cornish rex sphynx sphynx yet
                                                    cougar and panther. Panther siberian. Lynx munchkin
                                                    american shorthair. Norwegian forest. ',
                                                    button_link = 'https://data.ehden.eu/ShinyLandingPage/apps/QueryLibrary', button_label = 'Click me'))
                          
                        )))
    
  ) # end of fluid page
) # end of shiny