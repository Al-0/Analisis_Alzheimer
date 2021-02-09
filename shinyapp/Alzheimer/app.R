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
library(dplyr)
# install.packages("markdown")
library(markdown)

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
    titlePanel(title = "Enfermedad de Alzheimer. Análisis y modelado usando los datasets OASIS"),
    theme = shinytheme(theme = "superhero"),
    #shinythemes::themeSelector(), 
    dashboardPage(
        dashboardHeader(title = "Navegación"),
        skin = "purple",
        dashboardSidebar(
            sidebarMenu(
                menuItem(text = "Introducción",
                         tabName = "intro",
                         icon = icon(
                             name = "file-medical",
                             lib = "font-awesome")),
                menuItem(text = "Justificación",
                         tabName = "just",
                         icon = icon(
                             name = "align-justify",
                             lib = "font-awesome")),
                menuItem(text = "Alzheimer en México",
                         tabName = "mex",
                         icon = icon(
                             name = "flag",
                             lib = "font-awesome")),
                menuItem(text = "Dataset OASIS",
                         tabName = "oasis",
                         icon = icon(
                             name = "database",
                             lib = "font-awesome")),
                menuItem(text = "Limpieza de Datos",
                         tabName = "limpieza",
                         icon = icon(
                             name = "broom",
                             lib = "font-awesome")),
                menuItem(text = "Análisis Exploratorio",
                         tabName = "aed",
                         icon = icon(
                             name = "chart-bar",
                             lib = "font-awesome")),
                menuItem(text = "Modelo de Predicción",
                         tabName = "pred",
                         icon = icon(
                             name = "project-diagram",
                             lib = "font-awesome")),
                menuItem(text = "Presentación",
                         tabName = "pres",
                         icon = icon(
                             name = "youtube",
                             lib = "font-awesome")),
                menuItem(text = "Referencias",
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
                            titlePanel(h1("La Enfermedad de Alzheimer", align = "center")),
                            
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
                        tabsetPanel(
                                tabPanel(
                                    title = "Situación Actual",
                                    column(
                                        width = 10,
                                        
                                        titlePanel(h1("El Alzheimer en México", align = "center")),
                                        
                                        br(),
                                        h4("Como sabemos México es un país cuya población está envejeciendo, con una transformación radical en su antaña pirámide de base ancha que significaba una población joven mayoritaria y que va a paso acelerado hacia un rectángulo , seme- jante al de los países desarrollados, es además uno de los países latinoamericanos con mayor prevalencia con un 7.3% y con una incidencia de 27.3 (1000 persona/año) en la enfermedad de Alzheimer."),
                                        h4("En la actualidad hay más de 13 millones de adultos mayores de 60 años en México. Se estima que para el año 2050 si no es que antes el número de mexicanos afectados por la Enfermedad de Alzheimer será de más de 3.5 millones."),
                                        h4("Considerando que estamos por desgracia entre los primeros lugares en obesidad y diabetes mellitus a nivel mundial y que los factores de riesgo del síndrome metabólico contribuyen a que entre las primeras cinco causas de morbi-mortalidad estén la diabetes, las enfermedades cardiovascu- lares y el evento vascular cerebral no será sorprendente que no nada más disminuya el incremento de la longevidad proyectada para el 2050 que es de 80-83 años para hombres y mujeres sino que seguramente veremos un incremento en el deterioro cognitivo vascular y mixto."),
                                        img(src = "AlzheimerMex.jpg", height = 200, width = 440, style="display: block; margin-left: auto; margin-right: auto;"),
                                        h4("Es por este motivo entre muchos que México y sus profesionales de la salud se han encomendado a la tarea de hacer hincapié de la problemática que se nos avecina de ahí la importancia de una obra como la presente."),
                                        
                                        offset = 1
                                    )   
                                ),
                                tabPanel(
                                    title = "Infograma",
                                    br(),
                                    img(src = "info_mex.png", height = 1060, width = 740, style="display: block; margin-left: auto; margin-right: auto;"),
                                )
                        )
                    )
                ),
                tabItem(
                    tabName = "oasis",
                    fluidRow(
                        tabsetPanel(
                            tabPanel(
                                title = "OASIS",
                                column(
                                    width = 10,
                                    titlePanel(h1("OASIS Brains project", align = "center")),
                                    br(),
                                    h4("La serie de acceso abierto de estudios de imágenes (Open Access Series of Imaging Studies - OASIS) es una serie de datos de neuroimágenes abierto a todo público para su estudio y análisis."),
                                    h4("La serie consiste de 3 conjuntos de datos distintos. La primera serie, denominada OASIS-1, es un estudio transversal, lo cual significa que es un estudio observacional y descriptivo que mide la prevalencia de la exposición y del efecto en una muestra poblacional en un sólo momento. Dicho de otra manera, este estudio recolecta la información de diversas visitas por individuos distintos, teniendo cada individuo una sola visita."),
                                    h4("El segundo conjunto de datos, denominado OASIS-2, es por su parte un estudio longitudinal, es decir, un estudio donde se evalúa a un grupo de personas repetidamente a lo largo de varios años. Este conjunto tiene una cantidad menor de participantes, sin embargo cada paciente es examinado 2 o más veces (hasta 5), lo cual nos permite realizar un estudio del desarrollo de la enfermedad a lo largo de los años."),
                                    h4("El último conjunto en la colección, OASIS-3, es una recopilación de imágenes obtenidas a través de resonancia magnética (MRI) y tomografía por emisión de positrones (PET) en un estudio de tipo longitudinal. De los 3 datasets, este es el que contiene el mayor potencial para generar un modelo y algoritmo de predicción, especialmente a través del uso de aprendizaje automático (machine learning). Sin embargo, con los conocimientos, habilidades y herramientas con los que cuenta el equipo de trabajo actual, así como por restricciones de tiempo, el análisis utilizando este último conjunto deberá esperar, quedando así una ventana de oportunidad que esperamos explorar en un futuro no muy lejano."),
                                    br(),
                                    img(src = "oasis-logo.png", height = 200, width = 440, style="display: block; margin-left: auto; margin-right: auto;"),
                                    br(),
                                    h2("Variables"),
                                    h4("La información con la que contamos del dataset es la siguiente:"),
                                    tags$ul(
                                        tags$li(h4(strong("Demográfica.- "), "Existen 5 variables del tipo demográfico: Género (Gender, M/F), Mano dominante (Hand, R), Edad (Age), Educación (Educ) y estatus socioeconómico (SES). Las variables de educación y estatus socioeconómico tienen un valor discreto entre 1 y 5, en el caso de educación los valores representan: 1 - Menos de graduación de preparatoria, 2 - Graduación de preparatoria, 3 - Algo de estudio universitario, 4 - Graduado universitario, 5 - Superior a estudios universitarios. En el caso del indicador socioeconómico: 1 - Clase baja, 2 - Clase media-baja, 3 - Clase media, 4 - Clase media-alta, 5 - Clase Alta.")),
                                        tags$li(h4(strong("Clínica.- "), "Se tienen 2 variables: Mini-Mental State Examination (MMSE, 0-30) e índice clínico de demencia (Clinical Dementia Rating, CDR, 0-3). El MMSE es un examen de 30 preguntas para evaluar las habilidades cognitivas de un paciente, el cual sirve para indicar la presencia de algún impedimento cognitivo, más no para diagnosticar algún desorden. El CDR es una escala utilizada para cuantificar la gravedad (etapa) de los síntomas de demencia, teniendo una escala de: 0 - ninguno, 0.5 - muy ligero, 1 - ligero, 2 - moderado, 3 - severo. Cualquier participante con un CDR mayor a 0.5 fue diagnosticado con probable enfermedad de Alzheimer. Ningún paciente fue evaluado con un CDR de 3.")),
                                        tags$li(h4(strong("Volúmenes anatómicos estimados.- "), "Hay 3 variables: Volumen intracraneal total estimado (Estimated total intracranial volume, eTIV, mm3), Factor de escala atlas (Atlas scaling factor, ASF) y Volumen cerebral completo normalizado (Normalized whole brain volume, nWBV).")),
                                        tags$li(h4(strong("Longitudinales.- "), "El dataset longitudinal presenta unas cuantas variables extras: Group (Nondemented, Demented o Converted), el cual es un dato basado en el CDR y documenta si el paciente jamás presento demencia, inicio con ella o sí la desarrollo en el tiempo transcurrido en el estudio; Visit, el cual indica el número de la visita para un paciente; MR Delay, días entre la primera y la 'n' sesión."))
                                    ),
                                    offset = 1
                                )
                            ),
                            tabPanel(
                                title = "OASIS 1: Cross-sectional",
                                titlePanel(h1("OASIS-1: Cross-sectional MRI Data in Young, Middle Aged, Nondemented and Demented Older Adults", align = "center")),
                                dataTableOutput(outputId = "sectional_table")
                            ),
                            tabPanel(
                                title = "OASIS 2: Longitudinal",
                                titlePanel(h1("OASIS-2: Longitudinal MRI Data in Nondemented and Demented Older Adults", align = "center")),
                                dataTableOutput(outputId = "longitudinal_table")
                            )
                        )
                    )
                ),
                tabItem(
                    tabName = "limpieza",
                    fluidRow(
                        tabsetPanel(
                            tabPanel(
                                title = "Desarrollo",
                                column(
                                    width = 10,
                                    
                                    titlePanel(h1("Limpieza de datos", align = "center")),
                                    br(),   
                                    h2(strong("Cross Sectional")),
                                    h4("Para utilizar el csv provisto no fue necesario realizar una gran cantidad de modificaciones, sólo prescindir de ciertas columnas y filas. Por un lado, la variable 'Hand' fue removida, ya que todos los pacientes del conjunto de datos son diestros y por lo tanto esta variable no colabora información relevante."),
                                    h4("Por otro lado, la variable Delay es N/A para todas las entradas, excepto las últimas 20. Esto se debe a que los últimos 20 datos son datos de fiabilidad, en los que 20 pacientes sin demencia volvieron a tomar los estudios clínicos en un lapso no mayor a 90 días. Estos datos no serán considerados para el estudio, debido a que lo único que cambia en ellos son las variables anatómicas."),
                                    h4("Relacionado a la decisión de excluir los datos de fiabilidad en base a su componente anatómico, las 3 columnas de este campo no serán utilizadas en el presente proyecto. La razón de no incluir estas variables se debe a que su uso debe de ir acompañado de imágenes de resonancia magnética para su correcta interpretación y uso. Si bien, podríamos utilizarlo como variables de interés en la construcción de nuestro modelo, la veracidad de usar estas variables fuera de su uso verdadero pone en tela de juicio la validez de cualquier modelo generado."),
                                    br(),
                                    h2(strong("Longitudinal")),
                                    h4("Los mismos criterios para las variables anatómicas y mano se aplican a este dataset. Por otro lado, se prescinde de utilizar la variable de MR_Delay, optando por utilizar la edad de los pacientes para determinar la evolución de la condición según sea necesario. Adicionalmente se mutó la columna de género para declarar a cada paciente como 'Masculino' o 'Femenino'."),
                                    h4("Una pequeña corrección fue hecha al paciente 'OAS2_0036', el cuál tenía un conteo de visitas hasta 5 pero sin información para su segunda visita. Se modificó el conteo de visitas reflejar el hecho que sólo tuvo 4 sesiones."),
                                    
                                    offset = 1,
                                )
                            ),
                            tabPanel(
                                title = "OASIS 1: Clean Cross-sectional",
                                titlePanel(h1("OASIS-1: Cross-sectional MRI Data in Young, Middle Aged, Nondemented and Demented Older Adults", align = "center")),
                                dataTableOutput("clean_sectional_table")
                            ),
                            tabPanel(
                                title = "OASIS 2: Clean Longitudinal",
                                titlePanel(h1("OASIS-2: Longitudinal MRI Data in Nondemented and Demented Older Adults", align = "center")),
                                dataTableOutput("clean_longitudinal_table")
                            )
                        )
                    )
                ),
                tabItem(
                    tabName = "aed",
                    fluidRow(
                        tabsetPanel(
                            tabPanel(
                                title = "Análisis del Conjunto de Datos Longitudinal",
                                br(),
                                fluidRow(
                                    column(
                                        width = 10,
                                        includeMarkdown("./www/longitudinal/markdowns/long_age_distribution_header.md"),
                                        offset = 1)),
                                br(),
                                fluidRow(
                                    column(
                                        width = 5,
                                        fluidRow(
                                            selectInput(
                                                inputId = "cake_group",
                                                label = h4("Selecciona un grupo de tu interés"),
                                                choices = c("Todos los pacientes" = "All", "Saludables" = "Nondemented", "Sospechosos" = "Converted", "Dementes" = "Demented"))),
                                        fluidRow(),
                                        offset = 1),
                                    column(
                                        width = 5,
                                        plotOutput(outputId = "cake_graph_output"))),
                                br(),
                                fluidRow(
                                    column(
                                        width = 10,
                                        includeMarkdown("./www/longitudinal/markdowns/long_evolution_header.md"),
                                        offset = 1)),
                                br(),
                                fluidRow(
                                    column(
                                        width = 5,
                                        fluidRow(
                                            fluidRow(
                                                selectInput(
                                                    inputId = "selected_graph",
                                                    label = h4("Selecciona un gráfico"),
                                                    choices = c("Desarrollo en pacientes sanos" = "Converted", "Progreso en pacientes afectados" = "Demented"))),
                                            fluidRow(
                                                conditionalPanel(
                                                    condition = "input.selected_graph == 'Converted'",
                                                    includeMarkdown("./www/longitudinal/markdowns/long_evolution_converted.md")
                                                ),
                                                conditionalPanel(
                                                    condition = "input.selected_graph == 'Demented'",
                                                    includeMarkdown("./www/longitudinal/markdowns/long_evolution_demented.md")
                                                )
                                            )
                                        ),
                                        offset = 1),
                                    column(
                                        width = 5,
                                        conditionalPanel(
                                            condition = "input.selected_graph == 'Converted'",
                                            img(src = "./longitudinal/long_converted.gif")
                                        ),
                                        conditionalPanel(
                                            condition = "input.selected_graph == 'Demented'",
                                            img(src = "./longitudinal/long_demented.gif")
                                        ))),
                                br(),
                                fluidRow(
                                    column(
                                        width = 10,
                                        includeMarkdown("./www/longitudinal/markdowns/long_socioeconomic_analysis_header.md"),
                                        offset = 1)),
                                br(),
                                fluidRow(
                                    column(
                                        width = 5,
                                        fluidRow(
                                            selectInput(
                                                inputId = "socioeconomic_analysis_selected_facet_wrap",
                                                label = h4("Selecciona un grupo de tu interés"),
                                                choices = c("Todos los pacientes" = "All", "Pacientes con 5 visitas" = "5", "Pacientes con 4 visitas" = "4", "Pacientes con 3 visitas" = "3", "Pacientes con 2 visitas" = "2"))),
                                        fluidRow(),
                                        offset = 1),
                                    column(
                                        width = 5,
                                        plotOutput(outputId = "analysis_selected_facet_wrap_output"))),
                            ),
                            tabPanel(
                                title="Análisis Cross-sectional",
                                column(
                                    width = 10,
                                    br(),
                                    h2(strong("Análisis Edad - Demencia")),
                                    h4("En primera instancia es preciso analizar a los pacientes en base a su edad, considerando que la edad suele considerarse el factor más importante para el desarrollo de la enfermedad."),
                                    br(),
                                    img(src = "cross_edad.png", height = 440, style="display: block; margin-left: auto; margin-right: auto;"),
                                    br(),
                                    h4("Efectivamente, es posible apreciar que ninguno de los individuos con una edad menor a los 60 años (precisamente, 62 años) padece de la enfermedad en la población estudiada. Esto tiene sentido, ya que si bien la enfermedad no es exclusiva en pacientes de edad avanzada, los estudios médicos indican que la probabilidad de desarrollar Alzheimer a una temprana edad son sumamente bajas. Con esto en mente proseguimos a filtrar cualquier persona con una edad menor a 62 años."),
                                    br(),
                                    h2(strong("Frecuencia del estado de Demencia en la población filtrada")),
                                    h4("Para obtener la gráfica anterior fue necesario clasificar a los pacientes en términos de demencia, para lo cual se crearon 2 grupos: el de 'Demented' para cualquier persona con CDR arriba de 0 y el de 'Non Demented' para personas con CDR de 0. Esta clasificación es similar a la usada en el dataset longitudinal. Analizando rápidamente esta variable, podemos notar lo siguiente:"),
                                    br(),
                                    img(src = "cross_dist.png", height = 440, style="display: block; margin-left: auto; margin-right: auto;"),
                                    br(),
                                    h4("Se puede apreciar una distribución de aproximadamente el 50% para personas con y sin demencia."),
                                    br(),
                                    h2(strong("Distribución de género")),
                                    h4("Proseguimos a analizar el género de nuestra población que padece del trastorno. Realizando una gráfica de pastel obtenemos lo siguiente:"),
                                    br(),
                                    img(src = "cross_genero.png", height = 440, style="display: block; margin-left: auto; margin-right: auto;"),
                                    br(),
                                    h4("En el gráfico anterior se puede que la mayoría de los pacientes con el trastorno son mujeres, una relación de 60:40."),
                                    br(),
                                    h2(strong("Relación entre CDR y MMSE")),
                                    h4("Uno de los indicadores más importantes con los que contamos es el MMSE. La teoría nos dice que esta prueba sirve para evaluar el estado cognitivo de la persona, más no para diagnosticarla. Queremos saber exactamente como se ve esto en la práctica, así que realizamos la siguiente gráfica:"),
                                    img(src = "cross_cdr_mmse.png", height = 440, style="display: block; margin-left: auto; margin-right: auto;"),
                                    br(),
                                    h4("Analizando el gráfico obtenido podemos notar una fuerte correlación negativa entre una puntuación alta de MMSE y una puntuación baja de CDR. Sin embargo, existen pacientes que a pesar de tener un puntaje alto son diagnosticados con algún grado de demencia, lo cual comprueba lo estudiado en teoría, dando a entender que si bien la prueba es un fuerte indicador del estado del paciente, no garantiza un diagnóstico infalible para la predicción del Alzheimer."),
                                    
                                    
                                    offset = 1
                                )
                            ),
                            tabPanel(
                                title="Hipótesis",
                                column(
                                    width = 10,
                                    br(),
                                    h4("A través del análisis realizado sobre la población, se desarrollan ciertas hipótesis sobre la población a examinar:"),
                                    tags$ul(
                                        tags$li(h4(strong("La mayoría de los pacientes con algún estado de demencia son adultos mayores.- "), "Esta hipótesis se puede comprobar fácilmente observando la distribución de edades de los pacientes con o sin diagnóstico de demencia. Es imposible encontrar en el dataset personas menores de 60 años que presenten la condición, lo cual es corroborado con los estudios de la enfermedad, los cuáles indican que la presencia de la enfermedad en personas jóvenes es sumamente extraña.")),
                                        tags$li(h4(strong("Ser mujer implica una mayor probabilidad de desarrollar el trastorno.- "), "El análisis parece indicar que esta suposición es verdadera, puesto que el único grupo que presentó un mayor número de hombre que de mujeres fue el de las personas que comenzaron con demencia en el estudio longitudinal. La influencia exacta que tiene el género sobre el diagnóstico del paciente se estudiará en la sección de modelado, sin embargo, al analizar la literatura médica, es posible notar que el efecto del género probablemente es resultado de una falacia conocida como ", tags$i("Cum hoc ergo propter hoc, "), "lo cual implica que aunque dos variables tengan cierta correlación, esto no implica que una cause a la otra. La explicación de esto viene en el hecho de que, en promedio, las mujeres tienen una mayor expectativa de vida, y por lo tanto, es más probable que alcancen una edad en la que desarrollen un trastorno neurodegenerativo. Esto significa que el CDR y el género no están relacionados directamente, sino que ambos tienen una relación con una tercera variable: la edad.")),
                                        tags$li(h4(strong("El mejor indicador del CDR de un paciente es su calificación en el MMSE.- "), "La teoría nos dice que el MMSE es un indicador, más no una herramienta de diagnóstico. Con esto en mente cabe preguntar, ¿qué tan buen indicador eso? Las gráficas obtenidas parecen indicar cierta correlación, será necesario crear un modelo para comprobar su efectividad de predictor.")),
                                        tags$li(h4(strong("Es posible generar un modelo de predicción en base a las variables del dataset.- "), "Para corroborar esta teoría será necesario desarrollar un modelo de predicción. En base al análisis, se espera que la edad y el MMSE estén fuertemente relacionados con la puntuación de CDR, mientras que las otras variables pueden o no influir al modelo.")),
                                        tags$li(h4(strong("No todos los pacientes son capaces de solventar el gasto económico que implica un tratamiento de Alzheimer.- "), "Esta hipótesis es descartada debido a que en el Análisis Financiero, se muestra que la relación entre el número visitas de un paciente con el especialista no se ve afectado por su estatus socioeconómico."))
                                    ),
                                    offset = 1
                                )
                            )
                        )
                    )
                ),
                tabItem(
                    tabName = "pred",
                    fluidRow(
                        tabsetPanel(
                            tabPanel(
                                title = "Modelo Lineal",
                                column(
                                    width = 10,
                                    
                                    titlePanel(h1("Desarrollo de un modelo de predicción del CDR", align = "center")),
                                    br(),
                                    h4("Con el análisis realizado creemos factible la realización de un modelo lineal para predecir el valor de CDR. Al realizar el modelo de regresión múltiple con todas las variables con las que contamos, utilizando el dataset cross-sectional, obtenemos lo siguiente:"),
                                    br(),  
                                    img(src = "pred_modelo1.png", height = 440, style="display: block; margin-left: auto; margin-right: auto;"),
                                    br(),
                                    h4("Este análisis nos permitió desechar rápidamente la idea de utilizar los indicadores de educación y socioeconómicos, así como el género, esto debido a su alto p-value. Con esto en mente se creo un segundo modelo a partir de las 2 variables con p-values aceptables."),
                                    br(),
                                    img(src = "pred_modelo2.png", height = 440, style="display: block; margin-left: auto; margin-right: auto;"),
                                    br(),
                                    h4("El p-value de edad deja algo que desear, pero debido a que la teoría respalda la edad como un fuerte indicador seremos una poco indulgente hacia su p-value."),
                                    h4("El siguiente paso es analiza los valores residuales estandarizados del modelo creado para corroborar su veracidad:"),
                                    br(),
                                    img(src = "pred_resid.png", height = 440, style="display: block; margin-left: auto; margin-right: auto;"),
                                    br(),
                                    h4("Es aquí donde nuestro modelo lineal pierde su credibilidad. Se puede observar un patrón ligero en la gráfica de Edades, mientras que en la de MMSE el patrón resulta evidentemente claro. Esto nos indica que el modelo lineal no es el más indicado para este dataset, y que los resultados obtenidos no serán demasiado precisos."),
                                    br(),
                                    h4("A continuación se presenta el modelo lineal resultante, así como un widget para predecir con el mismo, sin embargo queda claro que los resultados obtenidos por este modelo presentan grandes problemas debido a la naturaleza no lineal del sistema."),
                                    br(),
                                    img(src = "pred_modlineal.png", height = 440, style="display: block; margin-left: auto; margin-right: auto;"),
                                    br(),
                                    br(),
                                    h2(strong("Modelo lineal interactivo"), align = "center"),
                                    box(plotOutput("plot_lineal", height = 450)),
                                    box(
                                        title = "Edad",
                                        sliderInput("age", "Años:", 1, 100, 50),
                                    ),
                                    box(
                                        title = "MMSE",
                                        sliderInput("mmse", "Puntaje:", 1, 30, 15)
                                    ),
                                    
                                    offset =1 
                                )
                            ),
                            tabPanel(
                                title = "Modelo de Máquinas de Vectores de Soporte",
                                column(
                                    width = 10,
                                    
                                    titlePanel(h1("Desarrollo de un modelo de predicción del CDR", align = "center")),
                                    br(),
                                    h4("Con el análisis realizado creemos factible la realización de un modelo lineal para predecir el valor de CDR. Al realizar el modelo de regresión múltiple con todas las variables con las que contamos, utilizando el dataset cross-sectional, obtenemos lo siguiente:"),
                                    br(),  
                                    img(src = "pred_modelo1.png", height = 440, style="display: block; margin-left: auto; margin-right: auto;"),
                                    br(),
                                    h4("Este análisis nos permitió deseschar rápidamente la idea de utilizar los indicadores de eduación y socioeconómicos, así como el genero, esto debido a su alto p-value. Con esto en mente se creó un segundo modelo a partir de las 2 variables con p-values aceptables."),
                                    
                                    offset =1 
                                )
                            )
                        )
                    )
                ),
                tabItem(
                    tabName = "pres",
                    fluidRow(
                        titlePanel(h1("Presentación del proceso y resultados obtenidos", align = "center")),
                        br(),
                        HTML('<p align="center"><iframe width="700" height="400" src="https://www.youtube.com/embed/T1-k7VYwsHg" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe></p>')
                    )
                ),
                tabItem(
                    tabName = "ref",
                    fluidRow(
                        column(
                            width = 10,
                            includeMarkdown("./www/references/References.md"),
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
    new_longitudinal <- read.csv("longitudinal_clean.csv")
    new_sectional <- read.csv("sectional_clean.csv")
    
    # Envia los datasets utilizados integramente al frontend y los muestra en una data table
    output$sectional_table <- renderDataTable(
        {sectional},
        options = list(aLengthMenu = c(10, 20, 50, 100), iDisplayLength = 10)
    )
    output$longitudinal_table <- renderDataTable(
        {longitudinal},
        options = list(aLengthMenu = c(10, 20, 50, 100), iDisplayLength = 10)
    )
    
    # Envia los datasets limpios al frontend y los muestra en una data table
    output$clean_sectional_table <- renderDataTable(
        {new_sectional},
        options = list(aLengthMenu = c(10, 20, 50, 100), iDisplayLength = 10)
    )
    output$clean_longitudinal_table <- renderDataTable(
        {new_longitudinal},
        options = list(aLengthMenu = c(10, 20, 50, 100), iDisplayLength = 10)
    )
    
    # Muestra la distribución del género de los pacientes según el grupo al que pertenecen
    output$cake_graph_output <- renderPlot({
        data_group <- ifelse(input$cake_group == "All", c(unique(new_longitudinal$Group)), input$cake_group)
        data_longitudinal <- new_longitudinal %>%
            filter(Group %in% data_group, Visit == 1)
        as.data.frame(table(data_longitudinal$M.F) / nrow(data_longitudinal)) %>%
            rename(Genero = Var1) %>%
            ggplot(aes(x = "", y = Freq, fill = Genero)) +
            geom_bar(stat = "identity", color = "white") +
            coord_polar(theta = "y") +
            scale_fill_manual(values = c("hotpink", "blue")) +
            theme_void()
    })
    
    # Muestra la dispersión de los pacientes en base a su nivel socioeconómico
    output$analysis_selected_facet_wrap_output <- renderPlot({
        if(input$socioeconomic_analysis_selected_facet_wrap == "All") {
            new_longitudinal %>%
                select(Subject.ID, Visit, SES, EDUC) %>%
                na.omit() %>%
                group_by(Subject.ID) %>%
                summarise(Visitas = max(Visit), SES, EDUC) %>%
                mutate(Visitas = factor(Visitas)) %>%
                unique() %>%
                as.data.frame() %>%
                ggplot(aes(SES, EDUC, group = Visitas)) +
                geom_point(aes(color = Visitas)) +
                xlab("Nivel Socioeconómico") +
                ylab("Años de Estudio")
        } else {
            new_longitudinal %>%
                select(Subject.ID, Visit, SES, EDUC) %>%
                na.omit() %>%
                group_by(Subject.ID) %>%
                summarise(Visitas = max(Visit), SES, EDUC) %>%
                mutate(Visitas = factor(Visitas)) %>%
                filter(Visitas == input$socioeconomic_analysis_selected_facet_wrap) %>%
                unique() %>%
                as.data.frame() %>%
                ggplot(aes(SES, EDUC, group = Visitas)) +
                geom_point(aes(color = Visitas)) +
                xlab("Nivel Socioeconómico") +
                ylab("Años de Estudio")
            
        }
    })
    
    ## Desarrollo del modelo de regresión lineal múltiple
    sectional_lineal <- new_sectional
    rows <- dim(sectional_lineal)[1]
    sectional_lineal <- sectional_lineal[1:(rows-20),];
    sectional_lineal <- na.omit(sectional_lineal)
    m <- lm(CDR ~ Age + MMSE, sectional_lineal)

    # Creación del gráfico interactivo y predicción lineal del CDR
    output$plot_lineal <- renderPlot({
        plot(m$fitted.values, sectional_lineal$CDR, main="Modelo de regresión lineal múltiple",
            sub="CDR = 2.375087 + 0.002396 * Age - 0.083702 * MMSE",
            xlab = "Valores ajustados de CDR", ylab = "CDR Predicto",
            xlim = c(-0.25,3.25), ylim = c(-0.25,3.25))
        abline(lsfit(m$fitted.values, sectional_lineal$CDR))
        CDR_estimate <- 2.375087 + 0.002396 * input$age - 0.083702 * input$mmse
        if (CDR_estimate < 0.25)
        {
            CDR_prediction <- 0
        }
        else if (CDR_estimate >= 0.25 && CDR_estimate < 0.75)
        {
            CDR_prediction <- 0.5
        }
        else if (CDR_estimate >= 0.75 && CDR_estimate < 1.5)
        {
            CDR_prediction <- 1
        }
        else if (CDR_estimate >= 1.5 && CDR_estimate < 2.5)
        {
            CDR_prediction <- 2
        }
        else if (CDR_estimate >= 2.5)
        {
            CDR_prediction <- 3
        }
        points(CDR_estimate, y = CDR_prediction ,pch = 18, col = "blue", cex = 3)
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
