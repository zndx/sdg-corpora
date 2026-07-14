CREATE TABLE Patient (
  id INTEGER NOT NULL,
  patientId VARCHAR(32),
  patientName VARCHAR(32),
  diagnosisDate TIMESTAMP,
  ageAtDiagnosis INTEGER,
  providerId INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (providerId) REFERENCES HealthcareProvider (providerId)
);
