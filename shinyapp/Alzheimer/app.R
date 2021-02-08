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
    # Estilo CSS, utilizado para reparar ciertos aspectos que hacian el texto díficil de leer.
    tags$style("
        .nav-tabs {
            background-color: #85929E;
        }
        
        .nav-tabs-custom .nav-tabs li.active:hover a, .nav-tabs-custom .nav-tabs li.active a {
            background-color: transparent;
            border-color: transparent;
        }
        
        .nav-tabs-custom .nav-tabs li.active {
        border-top-color: #FFF;
    }"
    ),
    titlePanel("Enfermedad de Alzheimer. Análisis y modelado usando los datasets OASIS."),
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
                menuItem("Justificación",
                         tabName = "just",
                         icon = icon(
                             name = "align-justify",
                             lib = "font-awesome")),
                menuItem("Alzheimer en México",
                         tabName = "mex",
                         icon = icon(
                             name = "flag",
                             lib = "font-awesome")),
                menuItem("Dataset OASIS",
                         tabName = "oasis",
                         icon = icon(
                             name = "database",
                             lib = "font-awesome")),
                menuItem("Limpieza de datos",
                         tabName = "limpieza",
                         icon = icon(
                             name = "broom",
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
                             lib = "font-awesome")),
                menuItem("Presentación",
                         tabName = "pres",
                         icon = icon(
                             name = "youtube",
                             lib = "font-awesome")),
                menuItem("Referencias",
                         tabName = "ref",
                         icon = icon(
                             name = "list-ul",
                             lib = "font-awesome"))
            )
        ),
        dashboardBody(
            style = "color:black",
            tabItems(
                tabItem(
                    tabName = "intro",
                    fluidRow(
                        column(
                            width = 10,
                            titlePanel(h1("La enfermedad de Alzheimer", align = "center")),
                            
                            br(),
                            h2("¿Qué es el Alzheimer?"),
                            br(),
                            h4("La enfermedad del Alzheimer es una enfermedad cerebral irreversible la cual destruye lentamente las habilidades de memoria, pensamiento, y eventualmente, la habilidad de llevar a cabo actividades diarias básicas, por lo cual el paciente necesita de cuidado de tiempo completo."),
                            h4("La enfermedad encaja en la clasificación de desórdenes del cerebro conocidos como demencia, siendo esta enfermedad el padecimiento más común de demencia.  La demencia es el término general para un grupo de enfermedades y desordenes que causan problemas de pensamiento, memoria y comportamiento."),
                            br(),
                            img(src = "alzheimer_puzzle.jpg", height = 260, width = 440, style="display: block; margin-left: auto; margin-right: auto;"),
                            br(),
                            h4("Sí bien los síntomas varían de personas a persona, todas las personas que sufren de Alzheimer padecen de ciertos síntomas tal como la pérdida de memoria, desorientación y problemas cognitivos. Las personas que padecen de la enfermedad de Alzheimer pueden encontrar dificultad para hallar las palabras adecuadas, reconocer objetos, reconocer a familia y amigos, así como sufrir de cambios emocionales bruscos, volviéndose irritables, frustrados y agitados."),
                            h4("Conforme la enfermedad evoluciona con el tiempo estos síntomas empeoran, dando lugar a problemas físicos, entre los que se encuentra la pérdida de fuerza y balance, así como una disminución en el control de la vejiga e intestinal, lo cual provoca incontinencia. En las últimas etapas de la enfermedad, conforme más y más áreas del cerebro se ven afectadas, el paciente empieza a perder control de funciones fisiológicas básicas, tal como pasar comida (disfagia) y respirar, lo cual eventualmente termina en la defunción del paciente."),
                            offset = 1
                        )
                    )
                ),
                tabItem(
                    tabName = "just",
                    fluidRow(
                        column(
                            width = 10,
                            titlePanel(h1("¿Cuál es la utilidad de desarrollar modelos de la enfermedad de Alzheimer?", align = "center")),
                            
                            br(),
                            h4("Debido a que los síntomas iniciales que preceden la enfermedad suelen tomar años en presentarse, la enfermedad de Alzheimer es comúnmente identificada en adultos mayores. Un sistema que permita el diagnóstico temprano de la enfermedad facilitaría tanto las intervenciones de tratamiento como el planeamiento familiar para el cuidado digno del paciente."),
                            h4("Desafortunadamente, el diagnóstico diferencial de la enfermedad de Alzheimer es un proceso intensivo, el cual consume mucho tiempo y es costoso, implicando el desarrollo de exámenes físicos y mentales, pruebas neurológicas y de laboratorio, así como la toma de imagenes cerebrales (como son la imágen por resonancia magnética - MRI, tomografía computarizada - CT, y tomografía por emisión de positrones - PET)."),
                            h4("Por lo anterior, sería conveniente tener un sistema que, si bien no diagnostique a una persona con un desorden neurodegenerativo (este tipo de diagnósticos jamás debe ser automatizado, siempre debe pasar por el juicio y criterio de un especialista humano), permita indicar de forma tentativa la posibilidad de que el paciente desarrolle en un futuro este desorden, facilitando así un poco el proceso de seguimiento de la enfermedad en los pacientes."),
                            img(src = "BrainMRI3planes.gif", height = 200, width = 440, style="display: block; margin-left: auto; margin-right: auto;"),
                            offset = 1
                        )
                    )
                ),
                tabItem(
                    tabName = "mex",
                    fluidRow(
                        
                    )
                ),
                tabItem(
                    tabName = "oasis",
                    fluidRow(
                        tabsetPanel(
                            tabPanel(
                                title = "OASIS",
                                column(width = 10,
                                       titlePanel(h1("OASIS Brains project", align = "center")),
                                       br(),
                                       h4("La serie de acceso abierto de estudios de imágenes (Open Access Series of Imaging Studies - OASIS) es una serie de datos de neuroimágenes abierto a todo público para su estudio y análisis."),
                                       h4("La serie consiste de 3 conjuntos de datos distintos. La primera serie, denominada OASIS-1, es un estudio transversal, lo cual significa que es un estudio observacional y descriptivo que mide la prevalencia de la exposición y del efecto en una muestra poblacional en un sólo momento. Dicho de otra manera, este estudio recolecta la información de diversas visitas por individuos distintos, teniendo cada individuo una sola visita."),
                                       h4("El segundo conjunto de datos, denominado OASIS-2, es por su parte un estudio longitudinal, es decir, un estudio donde se evalúa a un grupo de personas repetidamente a lo largo de varios años. Este conjunto tiene una cantidad menor de participantes, sin embargo cada paciente es examinado 2 o más veces (hasta 5), lo cual nos permite realizar un estudio del desarrollo de la enfermedad a lo largo de los años."),
                                       h4("El útlimo conjunto en la colección, OASIS-3, es una recopilación de imágenes obtenidas a través de resonancia magnética (MRI) y tomografía por emisión de positrones (PET) en un estudio de tipo longitudinal. De los 3 datasets, este es el que contiene el mayor potencial para generar un módelo y algoritmo de predicción, especialmente a través del uso de aprendizaje automático (machine learning). Sin embargo, con los conocimientos, habilidades y herramientas con los que cuenta el equipo de trabajo actual, así como por restricciones de tiempo, el análisis utilizando este último conjunto deberá esperar, quedando así una ventana de oportunidad que esperamos explorar en un futuro no muy lejano."),
                                       br(),
                                       img(src = "oasis-logo.png", height = 200, width = 440, style="display: block; margin-left: auto; margin-right: auto;"),
                                       br(),
                                       h2("Variables"),
                                       h4("La información con la que contamos del dataset es la siguiente:"),
                                       tags$ul(
                                           tags$li(h4(strong("Demográfica.-"), "Existen 5 variables del tipo demográfico: Género (Gender, M/F), Mano dominante (Hand, R), Edad (Age), Educación (Educ) y estatús socioeconómico (SES). Las variables de eduación y estatus socioeconómico tienen un valor discreto entre 1 y 5")),
                                       ),
                                       offset = 1
                                )
                            ),
                            tabPanel(
                                title = "OASIS 1: Cross-sectional",
                                titlePanel(h1("OASIS-1: Cross-sectional MRI Data in Young, Middle Aged, Nondemented and Demented Older Adults", align = "center")),
                                dataTableOutput("sectional_table")
                            ),
                            tabPanel(
                                title = "OASIS 2: Longitudinal",
                                titlePanel(h1("OASIS-2: Longitudinal MRI Data in Nondemented and Demented Older Adults", align = "center")),
                                dataTableOutput("longitudinal_table")
                            )
                        )
                    )
                ),
                tabItem(
                    tabName = "aed",
                    fluidRow(
                        titlePanel(h3("Análisis Exploratorio", align = "center")),
                        tabsetPanel(
                            tabPanel(
                                title = "Distribución de Género",
                                br(),
                                column(
                                    width = 5,
                                    fluidRow(selectInput("cake_group", "Selecciona un grupo de tu interés", choices = c("All", unique(read.csv("oasis_longitudinal.csv")$Group)))),
                                    fluidRow(h4("Prueba")),
                                    
                                    offset = 1
                                ),
                                column(
                                    width = 5,
                                    plotOutput("cake_graph_output")
                                )
                                
                                
                                # img(src = "max.png", height = 360, width = 540)
                            )
                        )
                        # dataTableOutput("eda_output")
                    )
                ),
                tabItem(
                    tabName = "pres",
                    fluidRow(
                        titlePanel(h3("Presentación del proceso y resultados obtenidos.", align = "center")),
                        br(),
                        HTML('<p align="center"><iframe width="700" height="400" src="https://www.youtube.com/embed/T1-k7VYwsHg" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe></p>')
                    )
                ),
                tabItem(
                    tabName = "ref",
                    fluidRow(
                        column(
                            width = 10,
                            includeMarkdown("README.md"),
                            offset = 1
                        )
                    )
                )
            )
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
    
    # install.packages("tidyverse")
    library(ggplot2)
    
    # install.packages("dplyr")
    library(dplyr)
    
    # Los datasets de OASIS utilizados para desarrollar el proyecto
    sectional <- read.csv("oasis_cross-sectional.csv")
    longitudinal <- read.csv("oasis_longitudinal.csv")
    
    # Limpieza de Datos
    new_longitudinal <- longitudinal %>%
        mutate(M.F = ifelse(M.F == 'F', 'Femenino', 'Masculino')) %>%
        select(- MR.Delay, - Hand, - eTIV, - nWBV, - ASF)
    
    # Envia los datasets utilizados integramente al frontend y los muestra en una data table
    output$sectional_table <- renderDataTable(
        {sectional},
        options = list(aLengthMenu = c(10, 20, 50, 100, 500), iDisplayLength = 10)
    )
    output$longitudinal_table <- renderDataTable(
        {longitudinal},
        options = list(aLengthMenu = c(10, 20, 50, 100, 500), iDisplayLength = 10)
    )
    
    # Muestra la distribución del género de los pacientes
    output$cake_graph_output <- renderPlot({
        as.data.frame(table(new_longitudinal$M.F) / nrow(new_longitudinal)) %>%
            rename(Género = Var1) %>%
            ggplot(aes(x = "''", y = Freq, fill = Género)) +
            geom_bar(stat = "identity", color = "white") +
            coord_polar(theta = "y") +
            scale_fill_manual(values = c("hotpink", "blue")) +
            theme_void()
    })
    
}

# Run the application 
shinyApp(ui = ui, server = server)