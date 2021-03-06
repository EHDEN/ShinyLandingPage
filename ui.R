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
    
    navbarPage(title=div(img(src="EHDEN_Avatar_small.png"), "EHDEN Data Repository"),
               inverse = F, # for diff color view
               theme = shinytheme("cerulean"),
               
               tabPanel("Home", icon = icon("home"),
                        HTML("<div style='vertical-align:middle; text-align:center'> 
                                  <img src='EHDEN_Logo.png' width='40%'  alt='This is alternate text'></img>
                             </div>"),
                        showcaseComponent(header="Welcome to the EHDEN Data Repository", 
                                          content="Here you can find data dashboards of studies performed in the EHDEN Data Network, and tools developed in close 
                                          collaboration with OHDSI",text="For more information about EHDEN visit our Website", url="https://www.ehden.eu",
                                          button=FALSE),
                        fluidRow(
                          column(6, panel_div(class_type = "primary", panel_title = "How to use the repository?",
                                              content = "This repository enables researchers in the EHDEN Data Network to share dashboards containing study results.
                                              In addition this repository contains web tools that are not related to a particular study but of interest for the community.
                                              If you have a tool or study result that you like to add create an issue in our github repository and we will support you. ")),
                          column(6, panel_div("primary", "Latest Apps", "To be added"))
                                                  ),  # end of fluidRow
                        fluidRow(
                          column(6, panel_div("primary", "Repository Status", "The Repository is currently under development by the EHDEN project and should no be used yet")),
                          column(6, panel_div("primary", "Contact",
                                              HTML("Email: <a href='mailto:enquiries@ehden.eu?Subject=Shiny%20Server%20Help' target='_top'>EHDEN Enquiries</a>")))
                          ,
                          
                          #### FAVICON TAGS SECTION ####
                          tags$head(tags$link(rel="shortcut icon", href="favicon.ico")),
                          
                          bsModal("modalExample", "The European Health Data and Evidence Network (EHDEN)", "tabBut", size = "medium" ,
                                  p("For more information please visit https://ehden.eu"),
                                  iframe(width = "560", height = "315", url_link = "https://www.youtube.com/embed/A_6jFu2Rdw4")
                                      )
                          
                        )),
               
               tabPanel("Tools", icon = icon("toolbox"),
                        fluidRow(
                          column(12, jumbotron(image = 'barcelona.png', "EHDEN Tools", "Tools developed by the EHDEN project in close collaboration with the OHDSI community",
                                              button = FALSE))
                        ),
                        
                        hr(),
                        fluidRow(
                          column(4, infoPanel(label = 'Query Library',
                                              content = 'Contains examples of queries against the OMOP Common Data Model for all the data domains and 
                                                        the Standardized Vocabularies.',
                                              button_link = 'https://data.ehden.eu/QueryLibrary/', button_label = 'Click me', lastUpdate = "23-03-2020")
                          ),
                          column(4, infoPanel(label = 'Tantalus',
                                              content = 'Enables the comparison of different versions of the Standardized Vocabularies obtain from the ATHENA tool',
                                              button_link = 'https://data.ehden.eu/TantalusApp/', button_label = 'Click me', lastUpdate = "23-03-2020")
                          )
                          )),
               tabPanel("Study-a-thons", icon = icon("users"),
                        fluidRow(
                          column(6, jumbotron(image = NULL, "EHDEN Study-a-thons", "Team work to perform high-impact disruptive research.",
                                              button = FALSE)),
                          column(3, HTML("<img src='barcelona-group.png' width='100%' height='100%' alt='This is alternate text'></img>")),
                          column(3, HTML("<img src='oxford-group.png' width='100%' height='100%' alt='This is alternate text'></img>"))
                                 
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