# Proyecto BEDU-Santander: Análisis de Alzheimer

Proyecto grupal de para el programa de "programación con BEDU" que consiste en el análisis de datos con el fin de generar un modelo de predicción que permita indicar de forma tentativa la posibilidad de que un paciente desarrolle en un futuro la enfermedad de Alzheimer.

## Índice


## Miembros del equipo 👥

* Alfonso Valenciana Díaz
* Ricardo Ariel Estrada Pérez
* Mauricio Iván Martínez Carmona

## Definición del problema 💡

### ¿Qué es el Alzheimer?
La enfermedad del Alzheimer es una enfermedad cerebral irreversible la cual destruye lentamente las habilidades de memoria, pensamiento, y eventualmente, la habilidad de llevar a cabo actividades diarias básicas, por lo cual el paciente necesita de cuidado de tiempo completo.

La enfermedad encaja en la clasificación de desórdenes del cerebro conocidos como demencia, siendo esta enfermedad el padecimiento más común de demencia. La demencia es el término general para un grupo de enfermedades y desordenes que causan problemas de pensamiento, memoria y comportamiento.

![Alzheimer](https://di-capacitados.com/images/easyblog_articles/84/b2ap3_large_alzeimer-demencia-senil.jpg)

Sí bien los síntomas varían de personas a persona, todas las personas que sufren de Alzheimer padecen de ciertos síntomas tal como la pérdida de memoria, desorientación y problemas cognitivos. Las personas que padecen de la enfermedad de Alzheimer pueden encontrar dificultad para hallar las palabras adecuadas, reconocer objetos, reconocer a familia y amigos, así como sufrir de cambios emocionales bruscos, volviéndose irritables, frustrados y agitados.

Conforme la enfermedad evoluciona con el tiempo estos síntomas empeoran, dando lugar a problemas físicos, entre los que se encuentra la pérdida de fuerza y balance, así como una disminución en el control de la vejiga e intestinal, lo cual provoca incontinencia. En las últimas etapas de la enfermedad, conforme más y más áreas del cerebro se ven afectadas, el paciente empieza a perder control de funciones fisiológicas básicas, tal como pasar comida (disfagia) y respirar, lo cual eventualmente termina en la defunción del paciente.

### Alzheimer en México

Como sabemos México es un país cuya población está envejeciendo, con una transformación radical en su antaña pirámide de base ancha que significaba una población joven mayoritaria y que va a paso acelerado hacia un rectángulo , seme- jante al de los países desarrollados, es además uno de los países latinoamericanos con mayor prevalencia con un 7.3% y con una incidencia de 27.3 (1000 persona/año) en la enfermedad de Alzheimer.

En la actualidad hay más de 13 millones de adultos mayores de 60 años en México. Se estima que para el año 2050 si no es que antes el número de mexicanos afectados por la Enfermedad de Alzheimer será de más de 3.5 millones.

![Alzheimer en México](https://www.alzheimermexico.org.mx/images/resources/tab-2-1.jpg)

Considerando que estamos por desgracia entre los primeros lugares en obesidad y diabetes mellitus a nivel mundial y que los factores de riesgo del síndrome metabólico contribuyen a que entre las primeras cinco causas de morbi-mortalidad estén la diabetes, las enfermedades cardiovascu- lares y el evento vascular cerebral no será sorprendente que no nada más disminuya el incremento de la longevidad proyectada para el 2050 que es de 80-83 años para hombres y mujeres sino que seguramente veremos un incremento en el deterioro cognitivo vascular y mixto.

## Justificación del problema

### ¿Cuál es la utilidad de desarrollar modelos de la enfermedad de Alzheimer?

Debido a que los síntomas iniciales que preceden la enfermedad suelen tomar años en presentarse, la enfermedad de Alzheimer es comúnmente identificada en adultos mayores. Un sistema que permita el diagnóstico temprano de la enfermedad facilitaría tanto las intervenciones de tratamiento como el planeamiento familiar para el cuidado digno del paciente.

Desafortunadamente, el diagnóstico diferencial de la enfermedad de Alzheimer es un proceso intensivo, el cual consume mucho tiempo y es costoso, implicando el desarrollo de exámenes físicos y mentales, pruebas neurológicas y de laboratorio, así como la toma de imagenes cerebrales (como son la imágen por resonancia magnética - MRI, tomografía computarizada - CT, y tomografía por emisión de positrones - PET).

Por lo anterior, sería conveniente tener un sistema que, si bien no diagnostique a una persona con un desorden neurodegenerativo (este tipo de diagnósticos jamás debe ser automatizado, siempre debe pasar por el juicio y criterio de un especialista humano), permita indicar de forma tentativa la posibilidad de que el paciente desarrolle en un futuro este desorden, facilitando así un poco el proceso de seguimiento de la enfermedad en los pacientes.

## Datos 📃

Para este análisis se hizo uso de dos datasets publicados por el _Open Access Series of Imaging Studies_ (OASIS) _Project_ en su [sitio web](https://www.oasis-brains.org/#data).
El proyecto OASIS Brains tiene por objetivo facilitar los descubrimientos en neurociencia básica y clínica mediante el análisis de datos.

### Descripción de los datasets


Para este proyecto hacemos uso de dos datasets: el [Cross-sectional MRI Data](https://www.oasis-brains.org/#data) y el [Longitudinal MRI Data](https://www.oasis-brains.org/#data).

#### Cross-sectional MRI Data
* Consiste en una colección transversal de 416 sujetos con edades entre los 18 y los 96 años, incluyendo individuos con la enfermedad de Alzheimer en etapa temprana.
* Para cada sujeto, se incluyen 3 o 4 resonancias magnéticas ponderadas en T1 individuales obtenidas en una sola sesión de imágenes.
* Todos los sujetos son diestros e incluyen hombres y mujeres.
* 100 de los sujetos incluidos mayores de 60 años han sido diagnosticados con la enfermedad de Alzheimer muy leve a leve.
* Para 20 de los sujetos no dementes, las imágenes de una sesión de exploración posterior después de un breve retraso (menos de 90 días) también se incluyen como un medio para evaluar la confiabilidad de la adquisición.

#### Longitudinal MRI Data
* Consiste en una colección longitudinal de 150 sujetos con edades entre los 60 y los 96 años.
* Cada sujeto fue escaneado en dos o más visitas, separadas por al menos un año para un total de 373 sesiones de imágenes.
* Todos los sujetos son diestros e incluyen hombres y mujeres.
* 72 de los sujetos se caracterizaron como no dementes durante todo el estudio. 
* 64 de los sujetos incluidos se caracterizaron como dementes en el momento de sus visitas iniciales y permanecieron así para las exploraciones posteriores, incluidos 51 individuos con enfermedad de Alzheimer leve a moderada. 
* Otros 14 sujetos se caracterizaron como no dementes en el momento de su visita inicial y posteriormente se caracterizaron como dementes en una visita posterior.

### Descripción de las columnas

| COLUMNA | DESCRIPCIÓN 
| -- | -- 
| M/F | Género 
| Hand | Mano dominante 
| Age | Edad 
| Educ | Nivel de estudios 
| SES | Nivel socioeconómico 
| MMSE | Puntaje en Mini Examen de Estado Mental 
| CDR | Nivel de Demencia Clínica  
| eTIV | Volumen intracraneal total estimado 
| ASF | Factor de escala Atlas
| nWBV | Volumen cerebral total normalizado

### Variables

La información con la que contamos del dataset es la siguiente:

**Demográfica**.- Existen 5 variables del tipo demográfico: Género (Gender, M/F), Mano dominante (Hand, R), Edad (Age), Educación (Educ) y estatus socioeconómico (SES). Las variables de educación y estatus socioeconómico tienen un valor discreto entre 1 y 5, en el caso de educación los valores representan: 
1 - Menos de graduación de preparatoria, 
2 - Graduación de preparatoria, 
3 - Algo de estudio universitario, 
4 - Graduado universitario, 
5 - Superior a estudios universitarios. En el caso del indicador socioeconómico: 1 - Clase baja, 2 - Clase media-baja, 3 - Clase media, 4 - Clase media-alta, 5 - Clase Alta.

**Clínica**.- Se tienen 2 variables: Mini-Mental State Examination (MMSE, 0-30) e índice clínico de demencia (Clinical Dementia Rating, CDR, 0-3). El MMSE es un examen de 30 preguntas para evaluar las habilidades cognitivas de un paciente, el cual sirve para indicar la presencia de algún impedimento cognitivo, más no para diagnosticar algún desorden. 
El CDR es una escala utilizada para cuantificar la gravedad (etapa) de los síntomas de demencia, teniendo una escala de: 0 - ninguno, 0.5 - muy ligero, 1 - ligero, 2 - moderado, 3 - severo. Cualquier participante con un CDR mayor a 0.5 fue diagnosticado con probable enfermedad de Alzheimer. Ningún paciente fue evaluado con un CDR de 3.

**Volúmenes anatómicos estimados**.- Hay 3 variables: Volumen intracraneal total estimado (Estimated total intracranial volume, eTIV, mm3), Factor de escala atlas (Atlas scaling factor, ASF) y Volumen cerebral completo normalizado (Normalized whole brain volume, nWBV).

**Longitudinales**.- El dataset longitudinal presenta unas cuantas variables extras: Group (Nondemented, Demented o Converted), el cual es un dato basado en el CDR y documenta si el paciente jamás presento demencia, inicio con ella o sí la desarrollo en el tiempo transcurrido en el estudio; Visit, el cual indica el número de la visita para un paciente; MR Delay, días entre la primera y la 'n' sesión.

## Limpieza de datos 🗑

### Cross Sectional
Para utilizar el csv provisto no fue necesario realizar una gran cantidad de modificaciones, sólo prescindir de ciertas columnas y filas. Por un lado, la variable 'Hand' fue removida, ya que todos los pacientes del conjunto de datos son diestros y por lo tanto esta variable no colabora información relevante.
Por otro lado, la variable Delay es N/A para todas las entradas, excepto las últimas 20. Esto se debe a que los últimos 20 datos son datos de fiabilidad, en los que 20 pacientes sin demencia volvieron a tomar los estudios clínicos en un lapso no mayor a 90 días. Estos datos no serán considerados para el estudio, debido a que lo único que cambia en ellos son las variables anatómicas.
Relacionado a la decisión de excluir los datos de fiabilidad en base a su componente anatómico, las 3 columnas de este campo no serán utilizadas en el presente proyecto. La razón de no incluir estas variables se debe a que su uso debe de ir acompañado de imágenes de resonancia magnética para su correcta interpretación y uso. Si bien, podríamos utilizarlo como variables de interés en la construcción de nuestro modelo, la veracidad de usar estas variables fuera de su uso verdadero pone en tela de juicio la validez de cualquier modelo generado.

### Longitudinal
Los mismos criterios para las variables anatómicas y mano se aplican a este dataset. Por otro lado, se prescinde de utilizar la variable de MR_Delay, optando por utilizar la edad de los pacientes para determinar la evolución de la condición según sea necesario. Adicionalmente se mutó la columna de género para declarar a cada paciente como 'Masculino' o 'Femenino'.
Una pequeña corrección fue hecha al paciente 'OAS2_0036', el cuál tenía un conteo de visitas hasta 5 pero sin información para su segunda visita. Se modificó el conteo de visitas reflejar el hecho que sólo tuvo 4 sesiones.

## Análisis exploratorio 🔎

### Distribución de género

Todos los pacientes

Sin demencia

Con demencia

Convertidos

### Análisis Cross-sectional
En primera instancia es preciso analizar a los pacientes en base a su edad, considerando que la edad suele considerarse el factor más importante para el desarrollo de la enfermedad.


Efectivamente, es posible apreciar que ninguno de los individuos con una edad menor a los 60 años (precisamente, 62 años) padece de la enfermedad en la población estudiada. Esto tiene sentido, ya que si bien la enfermedad no es exclusiva en pacientes de edad avanzada, los estudios médicos indican que la probabilidad de desarrollar Alzheimer a una temprana edad son sumamente bajas. Con esto en mente proseguimos a filtrar cualquier persona con una edad menor a 62 años.

## Hipótesis 🔬

A través del análisis realizado sobre la población, se desarrollan ciertas hipótesis sobre la población a examinar:

**La mayoría de los pacientes con algún estado de demencia son adultos mayores**.- Esta hipótesis se puede comprobar fácilmente observando la distribución de edades de los pacientes con o sin diagnóstico de demencia. Es imposible encontrar en el dataset personas menores de 60 años que presenten la condición, lo cuál es corroborado con los estudios de la enfermedad, los cuáles indican que la presencia de la enfermedad en personas jóvenes es sumamente extraña.

**Ser mujer implica una mayor probabilidad de desarrollar el transtorno**.- El análisis parece indicar que esta suposición es verdadera, puesto que el único grupo que presentó un mayor número de hombre que de mujeres fue el de las personas que comenzaron con demencia en el estudio longitudinal. La influencia exacta que tiene el género sobre el diagnóstico del paciente se estudiará en la sección de modelado, sin embargo, al analizar la literatura médica, es posible notar que el efecto del género probablemente es resultado de una falacia conocida como Cum hoc ergo propter hoc, lo cual implica que aunque dos variables tengan cierta correlación, esto no implica que una cause a la otra. La explicación de esto viene en el hecho de que, en promedio, la mujeres tienen una mayor expectativa de vida, y por lo tanto, es más probable que alcancen una edad en la que desarrollen un transtorno neurodegenerativo. Esto significa que el CDR y el género no estan relacionados directamente, sino que ambos tienen una relación con una tercera variable: la edad.

## Referencias 📚

Alzheimer's disease. (2020). National Institute of Health.  http://nihseniorhealth.gov/alzheimersdisease/symptomsanddiagnosis/01.html. Accessed February 7, 2021.

Daniel S. Marcus, et al. Open Access Series of Imaging Studies (OASIS): Cross-sectional MRI Data in Young, Middle Aged, Nondemented, and Demented Older Adults. https://www.mitpressjournals.org/doi/abs/10.1162/jocn.2007.19.9.1498 Accessed February 7, 2021.

Daniel S. Marcus, et al. Open Access Series of Imaging Studies: Longitudinal MRI Data in Nondemented and Demented Older Adults. https://www.mitpressjournals.org/doi/full/10.1162/jocn.2009.21407 Accessed February 7, 2021.

Daniel S. Marcus, et al. Corss-Sectional Data Across The Adult Lifespan. https://www.oasis-brains.org/files/oasis_cross-sectional_facts.pdf. Accessed February 7, 2021.

Lawrence V. Fulton, et al. Classification of Alzheimer’s Disease with and without Imagery Using Gradient Boosted Machines and ResNet-50. https://www.mdpi.com/2076-3425/9/9/212/htm. Accessed February 7, 2021.

Mayo Clinic. (2020). Enfermedad de Alzheimer. https://www.mayoclinic.org/es-es/diseases-conditions/alzheimers-disease/diagnosis-treatment/drc-20350453. Accessed February 7, 2021.

Neus Falgas Martínez, et al. (2018). Pronóstico Alzheimer. https://www.clinicbarcelona.org/asistencia/enfermedades/alzheimer/evolucion-de-la-enfermedad. Accessed February 7, 2021.

OASIS. (2020). OASIS Brains Project. https://www.oasis-brains.org/ Accessed February 7, 2021.

Texas Department of State Health Services. (2018). What is Alzheimer's Disease? Questions and Answers. https://dshs.texas.gov/alzheimers/qanda.shtm. Accessed February 7, 2021.

Willacy, H. (2020). Mini Mental State Examination. https://patient.info/doctor/mini-mental-state-examination-mmse Accessed February 7, 2021.

Wolk DA, et al. (2014). Clinical features and diagnosis of Alzheimer disease. http://www.uptodate.com/home. Accessed February 7, 2021.


## Licencia 📄

Este proyecto está bajo la Licencia MIT - mirar el archivo [LICENSE.md](LICENSE.md) para detalles.
