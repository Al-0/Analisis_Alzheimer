#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinydashboard)
library(shinythemes)

# Define UI for application
ui <- fluidPage(
    titlePanel("Enfermedad de Alzheimer. Análisis y Exploración."),
    theme = shinytheme("superhero"),
    #shinythemes::themeSelector(), 
    dashboardPage(
        dashboardHeader(title = "Navegación"),
        skin = "purple",
        dashboardSidebar(
            sidebarMenu(
                menuItem("Introducción",
                         tabName = "intro",
                         icon = icon(
                             name = "file-medical",
                             lib = "font-awesome")),
                menuItem("Alzheimer en México",
                         tabName = "mex",
                         icon = icon(
                             name = "flag",
                             lib = "font-awesome")),
                menuItem("Dataset OASIS",
                         tabName = "",
                         icon = icon(
                             name = "database",
                             lib = "font-awesome")),
                menuItem("Análisis Exploratorio",
                         tabName = "aed",
                         icon = icon(
                             name = "chart-bar",
                             lib = "font-awesome")),
                menuItem("Modelo de predicción",
                         tabName = "pred",
                         icon = icon(
                             name = "project-diagram",
                             lib = "font-awesome"))
            )
        ),
        dashboardBody(
            tabItems(
                tabItem(
                    tabName = "intro",
                    fluidRow(
                        titlePanel(h1("La enfermedad de Alzheimer", align = "center")),
                
                        br(),
                        br(),
                        h2("¿Qué es el Alzheimer?"),
                        br(),
                        h4("La enfermedad del Alzheimer es una enfermedad cerebral irreversible la cual destruye lentamente las habilidades de memoria, pensamiento, y eventualmente, la habilidad de llevar a cabo actividades diarias básicas, por lo cual el paciente necesita de cuidado de tiempo completo."),
                        h4("La enfermedad encaja en la clasificación de desórdenes del cerebro conocidos como demencia, siendo esta enfermedad el padecimiento más común de demencia.  La demencia es el término general para un grupo de enfermedades y desordenes que causan problemas de pensamiento, memoria y comportamiento."),
                        h4("Sí bien los síntomas varían de personas a persona, todas las personas que sufren de Alzheimer padecen de ciertos síntomas tal como la pérdida de memoria, desorientación y problemas cognitivos. Las personas que padecen de la enfermedad de Alzheimer pueden encontrar dificultad para hallar las palabras adecuadas, reconocer objetos, reconocer a familia y amigos, así como sufrir de cambios emocionales bruscos, volviéndose irritables, frustrados y agitados."),
                        h4("Conforme la enfermedad evoluciona con el tiempo estos síntomas empeoran, dando lugar a problemas físicos, entre los que se encuentra la pérdida de fuerza y balance, así como una disminución en el control de la vejiga e intestinal, lo cual provoca incontinencia. En las últimas etapas de la enfermedad, conforme más y más áreas del cerebro se ven afectadas, el paciente empieza a perder control de funciones fisiológicas básicas, tal como pasar comida (disfagia) y respirar, lo cual eventualmente termina en la defunción del paciente.")
                    )
                ),
                tabItem(
                    tabName = "graph",
                    fluidRow(
                        tabsetPanel(
                            tabPanel(
                                title = "Home Team",
                                img(src = "PMFTHG.png")),
                            tabPanel(
                                title = "Away Team",
                                img(src = "PMFTAG.png")),
                            tabPanel(
                                title = "Home Team vs Away Team",
                                img(src = "PC.png"))
                        )
                    )
                ),
                tabItem(
                    tabName = "data-table",
                    fluidRow(
                        titlePanel(h3("Tabla de Datos de Match.Data", align = "center")),
                        dataTableOutput("data_table")
                    )
                ),
                tabItem(
                    tabName = "images",
                    fluidRow(
                        tabsetPanel(
                            tabPanel(
                                title = "Factor de ganancia promedio",
                                img(src = "avg.png", height = 360, width = 540)
                            ),
                            tabPanel(
                                title = "Factor de ganancia máximo",
                                img(src = "max.png", height = 360, width = 540)
                            )
                        )
                    )                
                )
            )
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
    library(ggplot2)
    library(dplyr)
    
    
    
    output$plot1 <- renderPlot({
        
        res <- vector()
        for (i in 1:dim(match.data)[1]){
            if(match.data$home.score[i] > match.data$away.score[i]) {
                res[i] <- "H"
            } else {
                if(match.data$home.score[i] < match.data$away.score[i]) {
                    res[i] <- "A"
                } else {
                    res[i] <- "D"
                }
            }
        }
        
        match.data <- mutate(match.data, FTR = res)
        #summary(match.data)
        match.data %>% ggplot(aes(match.data[,ifelse(input$x == "Goles de Local", "home.score", "away.score")], fill = FTR)) + 
            geom_bar() + 
            facet_wrap("away.team") +
            
            labs(x =input$x, y = "Goles") + 
            ylim(0,50)
    })
    
    
    output$data_table <- renderDataTable(
        {match.data},
        options = list(aLengthMenu = c(20, 50, 100, 500, 1000), iDisplayLength = 20)
    )
}

# Run the application 
shinyApp(ui = ui, server = server)