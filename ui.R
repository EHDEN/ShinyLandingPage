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
    
    navbarPage(title=div(img(src="EHDEN_avatar_small.png"), "EHDEN Data Repository"),
               inverse = F, # for diff color view
               theme = shinytheme("cerulean"),
               
               tabPanel("Home", icon = icon("home"),
                        
                        showcaseComponent(image="EHDEN_Logo.png",header="Welcome to the EHDEN Data Repository", 
                                          content="Here you can find data dashboards of studies produced by EHDEN Data Partners and tools developed by EHDEN",
                                          button=FALSE),
                        fluidRow(
                          column(6, panel_div(class_type = "primary", panel_title = "How to use the repository?",
                                              content = "This repository enables researchers in the EHDEN Data Network to share dashboards containing study results.
                                              In addition this repository contains Shiny web tools not related to a particular study.
                                              If you have a tool or study result that you like to add create an issue in our github repository and we will support you. ")),
                          column(6, panel_div("primary", "Latest Apps", "To be added"))
                                                  ),  # end of fluidRow
                        fluidRow(
                          column(6, panel_div("primary", "Repository Status", "The Repository is currently under development by the EHDEN projects and should no be used yet")),
                          column(6, panel_div("primary", "Contact",
                                              HTML("Email Me: <a href='mailto:enquiries@ehden.eu?Subject=Shiny%20Server%20Help' target='_top'>EHDEN Support</a>")))
                          ,
                          
                          #### FAVICON TAGS SECTION ####
                          tags$head(tags$link(rel="shortcut icon", href="favicon.ico")),
                          
                          bsModal("modalExample", "The European Health Data and Evidence Network (EHDEN)", "tabBut", size = "medium" ,
                                  p("For more information please visit https://ehden.eu"),
                                  iframe(width = "560", height = "315", url_link = "https://www.youtube.com/embed/A_6jFu2Rdw4")
                                      )
                          
                        )),
               
               
               tabPanel("Study-a-thons", icon = icon("calendar"),
                        fluidRow(
                          column(6, jumbotron(image = 'barcelona.png', "EHDEN Study-a-thons", "Team work to perform high-impact disruptive research.",
                                              button = FALSE)),
                          column(3, HTML("<img src='barcelona.png' width='400' height='300' alt='This is alternate text'></img>")),
                          column(3, HTML("<img src='oxford.png' width='400' height='300' alt='This is alternate text'></img>"))
                                 
                        ),
                       
                        hr(),
                        fluidRow(
                          column(4, infoPanel(label = 'Effect Estimation in Rheumatoid Arthritis',
                                                    content = 'These research results are from a retrospective, real-world, 
                                                    observational study to estimate the population-level effects of conventional 
                                                    synthetic disease-modifying antirheumatic drugs among patients with rheumatoid arthritis. 
                                                    This web-based application provides an interactive platform to explore all analysis results 
                                                    enerated as part of this study, as a supplement to abstracts and a full manuscript currently 
                                                    in development for submission to scientific conferences and a peer-reviewed journal. 
                                                    During abstract and manuscript development and the subsequent review period, 
                                                    these results are considered under embargo and should not be disclosed 
                                                    without explicit permission and consent from the authors.',
                                                    button_link = 'https://data.ohdsi.org/EhdenRaDmardsEstimation/', button_label = 'Click me', lastUpdate = "23-03-2020")
                          ),
                          column(4, infoPanel(label = 'Patient-Level Prediction in Rheumatoid Arthritis',
                                                    content = 'European League Against Rheumatism (EULAR) guidelines recommend the early initiation
                                                    of methotrexate (MTX) monotherapy as soon as possible after the diagnosis of rheumatoid arthritis (RA). 
                                                    However, many adverse health outcomes may occur. Evaluating the patient-level risk for adverse health 
                                                    outcomes would allow clinicians to provide more personalised care. The objective of this study is to 
                                                    develop and validate patient-level prediction models for adverse health outcomes including leukopenia, 
                                                    pancytopenia, infection (serious, opportunistic, all), cardiovascular disease (CVD) (myocardial infarction (MI), stroke), 
                                                    and cancer (breast, colorectal, uterus) in adult RA patients initiating first-line treatment of MTX monotherapy.',
                                                    button_link = 'https://data.ohdsi.org/ehdenRaPrediction/', button_label = 'Click me', lastUpdate = "23-03-2020"))
                        )),
                        tabPanel("Statistics", icon = icon("cog"),
                                 h1("Hello Visitors! This page is still under development", align = "center"),
                                 hr(),
                                 
                                 list_group(div(list_item("Repository Updates", badge_value = 27),
                                                list_item("Number of Applications", badge_value = 2)))
                                 
                                 
                        ))
    
  ) # end of fluid page
) # end of shiny