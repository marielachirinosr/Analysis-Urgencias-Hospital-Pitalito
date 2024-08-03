# Hospital Overview

The E.S.E Hospital Departamental de Pitalito provides compassionate and reliable healthcare services, supported by the knowledge management of its human talent and the best technology, ensuring sustainability and permanence over time. The hospital focuses on organizational transformation and improving the quality of life of the population it serves.

* **Hospital Name:** E.S.E Hospital Departamental de Pitalito
* **User Satisfaction:** 95.0%
* **Number of Beds:** 276
* **Staff:** 978
* **Specialist Doctors:** 95

# Data Analysis Process

This project involves the creation of a star schema to analyze hospital admissions data from the emergency area of the Hospital Departamental de Pitalito. The data includes various attributes such as period, income, admission date, triage level, medical unit, medical specialty, diagnostic codes, patient demographics, and location details. The project utilizes an ETL (Extract, Transform, Load) process on BigQuery, followed by visualization with Tableau.

## Data and Schema

The primary table in the star schema is `fact_ingreso`, which contains the main transactional data. The supporting dimension tables are:

* `dim_time`: Contains time-related information.
* `dim_patient`: Includes patient demographics and details.
* `dim_medical`: Stores medical-related data such as specialties and diagnostics.
* `dim_location`: Provides location details including municipality and neighborhood.
* `dim_entity`: Captures entity-related data, such as the healthcare provider.

## ETL Process

* **Extract:** Data was extracted from various sources containing hospital admission records.
* **Transform:** The data was cleaned, normalized, and transformed to fit into the star schema structure.
* **Load:** The transformed data was loaded into BigQuery tables.

## BigQuery Implementation

* **Bucket Creation:** A Google Cloud Storage bucket was created to store scripts and data files.
* **Job Execution:** Dataflow jobs were implemented to automate the ETL process.
* **Queries:** SQL queries were executed to aggregate and analyze the data.

# Data Visualization

![Tableau Dashboard](/ServiciosMedicosHospitalPitalito.png)

The final dataset was visualized using a Tableau dashboard, providing insights into hospital admissions, patient demographics, and medical diagnoses. Below are the key insights from the Tableau dashboard:

## Severity Distribution by Triage Level

The majority of cases fall under Triage level 3 (1,979 cases) and Triage level 4 (1,089 cases), with fewer cases in Triage level 2 (592 cases).

## Medical Entities Distribution

The most common medical entities are E.P.S. Sanitas (251 cases) and Nueva EPS (245 cases), followed by ASMET Salud (232 cases) and Mallamas EPS (161 cases). The average number of cases per entity is highlighted with a reference line.

## Gender Distribution

The gender distribution is almost even, with 21,981 male patients and 21,692 female patients.

## Patient Regimen Types

The majority of patients are under the Subsidized regime (29,054 cases) and the Contributory regime (10,134 cases). Other regimes, such as "Other," "Displaced," and "Foreigners," have significantly fewer cases.

## Diagnostic Syndromes

Common diagnostic syndromes include non-specific pain (55 cases), unspecified wound (55 cases), and acute pain (47 cases). Other frequent syndromes are contusions (45 cases) and abdominal pain (44 cases).


# Descripción del Hospital

El E.S.E Hospital Departamental de Pitalito proporciona servicios de salud humanizados y confiables, respaldados por la gestión del conocimiento de su talento humano y la mejor tecnología, asegurando sostenibilidad y permanencia en el tiempo. El hospital se enfoca en la transformación organizacional y en mejorar la calidad de vida de la población a la que sirve.

* **Nombre del Hospital:** E.S.E Hospital Departamental de Pitalito
* **Satisfacción del Usuario:** 95.0%
* **Número de Camas:** 276
* **Personal:** 978
* **Médicos Especialistas:** 95

# Proceso de Análisis de Datos

Este proyecto involucra la creación de un esquema en estrella para analizar los datos de admisiones hospitalarias del área de emergencias del Hospital Departamental de Pitalito. Los datos incluyen varios atributos como período, ingresos, fecha de admisión, nivel de triaje, unidad médica, especialidad médica, códigos diagnósticos, demografía de pacientes y detalles de ubicación. El proyecto utiliza un proceso ETL (Extracción, Transformación, Carga) en BigQuery, seguido de visualización con Tableau.

## Datos y Esquema

La tabla principal en el esquema en estrella es `fact_ingreso`, que contiene los datos transaccionales principales. Las tablas de dimensión de soporte son:

* `dim_time`: Contiene información relacionada con el tiempo.
* `dim_patient`: Incluye detalles y demografía de los pacientes.
* `dim_medical`: Almacena datos relacionados con la medicina, como especialidades y diagnósticos.
* `dim_location`: Proporciona detalles de ubicación, incluyendo municipio y barrio.
* `dim_entity`: Captura datos relacionados con las entidades, como el proveedor de salud.

## Proceso ETL

* **Extracción:** Los datos fueron extraídos de varias fuentes que contenían registros de admisiones hospitalarias.
* **Transformación:** Los datos fueron limpiados, normalizados y transformados para adaptarse a la estructura del esquema en estrella.
* **Carga:** Los datos transformados fueron cargados en tablas de BigQuery.

## Implementación en BigQuery

* **Creación de Bucket:** Se creó un bucket en Google Cloud Storage para almacenar scripts y archivos de datos.
* **Ejecución de Trabajos:** Se implementaron trabajos de Dataflow para automatizar el proceso ETL.
* **Consultas:** Se ejecutaron consultas SQL para agregar y analizar los datos.

# Visualización de Datos

![Tableau Dashboard](/ServiciosMedicosHospitalPitalito.png)

El conjunto de datos final se visualizó utilizando un dashboard de Tableau, proporcionando información sobre las admisiones hospitalarias, la demografía de los pacientes y los diagnósticos médicos. A continuación, se presentan los principales hallazgos del dashboard de Tableau:

## Distribución de la Gravedad según el Triaje

La mayoría de los casos se encuentran en el nivel de triaje 3 (1,979 casos) y el nivel de triaje 4 (1,089 casos), con menos casos en el nivel de triaje 2 (592 casos).

## Distribución de Entidades Médicas

Las entidades médicas más comunes son E.P.S. Sanitas (251 casos) y Nueva EPS (245 casos), seguidas por ASMET Salud (232 casos) y Mallamas EPS (161 casos). El número promedio de casos por entidad se destaca con una línea de referencia.

## Distribución por Género

La distribución de género es casi igual, con 21,981 pacientes masculinos y 21,692 pacientes femeninos.

## Tipos de Régimen de Pacientes

La mayoría de los pacientes están bajo el régimen Subsidiado (29,054 casos) y el régimen Contributivo (10,134 casos). Otros regímenes, como "Otro," "Desplazados," y "Extranjeros," tienen significativamente menos casos.

## Síndromes Diagnósticos

Los síndromes diagnósticos más comunes incluyen dolor inespecífico (55 casos), herida no especificada (55 casos) y dolor agudo (47 casos). Otros síndromes frecuentes son contusiones (45 casos) y dolor abdominal (44 casos).