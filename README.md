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
