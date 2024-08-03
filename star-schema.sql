CREATE OR REPLACE TABLE hospital-pitalito.star_schema.dim_patient (
    PatientID INT64,
    Sexo STRING,
    FechaNacimiento TIMESTAMP,
    GrupoEtario1 STRING,
    GrupoEtario2 STRING,
    TipoRegimen STRING,
    Edad INT64,
    UnidadEdad STRING
);

INSERT INTO hospital-pitalito.star_schema.dim_patient (PatientID, Sexo, FechaNacimiento, GrupoEtario1, GrupoEtario2, TipoRegimen, Edad, UnidadEdad)
SELECT 
    ROW_NUMBER() OVER () AS PatientID,
    Sexo,
    FechaNacimiento,
    GrupoEtario1,
    GrupoEtario2,
    TipoRegimen,
    Edad,
    UnidadEdad
FROM (
    SELECT DISTINCT Sexo, FechaNacimiento, GrupoEtario1, GrupoEtario2, TipoRegimen, Edad, UnidadEdad FROM hospital-pitalito.data_hospital.data_urgencias
);

CREATE OR REPLACE TABLE hospital-pitalito.star_schema.dim_time (
    TimeID INT64,
    Periodo TIMESTAMP,
    FechaIngreso TIMESTAMP,
    FechaHistoria TIMESTAMP
);

INSERT INTO hospital-pitalito.star_schema.dim_time (TimeID, Periodo, FechaIngreso, FechaHistoria)
SELECT 
    ROW_NUMBER() OVER () AS TimeID,
    Periodo,
    FechaIngreso,
    FechaHistoria
FROM (
    SELECT DISTINCT Periodo, FechaIngreso, FechaHistoria FROM hospital-pitalito.data_hospital.data_urgencias
);

CREATE OR REPLACE TABLE hospital-pitalito.star_schema.dim_medical (
    MedicalID INT64,
    Triage INT64,
    Unidad STRING,
    EspecialidadMedico STRING,
    CodigoDiagnostico STRING,
    NombreDiagnostico STRING
);

INSERT INTO hospital-pitalito.star_schema.dim_medical (MedicalID, Triage, Unidad, EspecialidadMedico, CodigoDiagnostico, NombreDiagnostico)
SELECT 
    ROW_NUMBER() OVER () AS MedicalID,
    Triage,
    Unidad,
    EspecialidadMedico,
    CodigoDiagnostico,
    NombreDiagnostico
FROM (
    SELECT DISTINCT Triage, Unidad, EspecialidadMedico, CodigoDiagnostico, NombreDiagnostico FROM hospital-pitalito.data_hospital.data_urgencias
);

CREATE OR REPLACE TABLE hospital-pitalito.star_schema.dim_location (
    LocationID INT64,
    MunicipioRes INT64,
    BarrioVereda STRING,
    Direccion STRING
);

INSERT INTO hospital-pitalito.star_schema.dim_location (LocationID, MunicipioRes, BarrioVereda, Direccion)
SELECT 
    ROW_NUMBER() OVER () AS LocationID,
    MunicipioRes,
    BarrioVereda,
    Direccion
FROM (
    SELECT DISTINCT MunicipioRes, BarrioVereda, Direccion FROM hospital-pitalito.data_hospital.data_urgencias
);

CREATE OR REPLACE TABLE hospital-pitalito.star_schema.dim_entity (
    EntityID INT64,
    Entidad STRING,
    DxSindromatico STRING
);

INSERT INTO hospital-pitalito.star_schema.dim_entity (EntityID, Entidad, DxSindromatico)
SELECT 
    ROW_NUMBER() OVER () AS EntityID,
    Entidad,
    DxSindromatico
FROM (
    SELECT DISTINCT Entidad, DxSindromatico FROM hospital-pitalito.data_hospital.data_urgencias
);

CREATE OR REPLACE TABLE hospital-pitalito.star_schema.fact_ingreso (
    IngresoID INT64,
    PatientID INT64,
    TimeID INT64,
    Ingreso INT64,
    MedicalID INT64,
    LocationID INT64,
    EntityID INT64
);

INSERT INTO hospital-pitalito.star_schema.fact_ingreso (IngresoID, PatientID, TimeID, Ingreso, MedicalID, LocationID, EntityID)
SELECT 
    ROW_NUMBER() OVER () AS IngresoID,
    (SELECT PatientID FROM hospital-pitalito.data_hospital.dim_patient WHERE Sexo = src.Sexo AND FechaNacimiento = src.FechaNacimiento AND GrupoEtario1 = src.GrupoEtario1 AND GrupoEtario2 = src.GrupoEtario2 AND TipoRegimen = src.TipoRegimen AND Edad = src.Edad AND UnidadEdad = src.UnidadEdad) AS PatientID,
    (SELECT TimeID FROM hospital-pitalito.data_hospital.dim_time WHERE Periodo = src.Periodo AND FechaIngreso = src.FechaIngreso AND FechaHistoria = src.FechaHistoria) AS TimeID,
    src.Ingreso,
    (SELECT MedicalID FROM hospital-pitalito.data_hospital.dim_medical WHERE Triage = src.Triage AND Unidad = src.Unidad AND EspecialidadMedico = src.EspecialidadMedico AND CodigoDiagnostico = src.CodigoDiagnostico AND NombreDiagnostico = src.NombreDiagnostico) AS MedicalID,
    (SELECT LocationID FROM hospital-pitalito.data_hospital.dim_location WHERE MunicipioRes = src.MunicipioRes AND BarrioVereda = src.BarrioVereda AND Direccion = src.Direccion) AS LocationID,
    (SELECT EntityID FROM hospital-pitalito.data_hospital.dim_entity WHERE Entidad = src.Entidad AND DxSindromatico = src.DxSindromatico) AS EntityID
FROM hospital-pitalito.data_hospital.data_urgencias src;
