SELECT
    NombreDiagnostico,
    Triage,
    COUNT(*) AS CountDiagnoses
FROM
    hospital-pitalito.data_hospital.dim_medical
GROUP BY
    NombreDiagnostico,
    Triage
ORDER BY
    NombreDiagnostico,
    Triage ASC;