CREATE TABLE clinical_documentations (
  clinical_documentation_id INTEGER NOT NULL,
  doc_id INTEGER,
  doc_type VARCHAR(32),
  creation_date TIMESTAMP,
  status VARCHAR(32),
  contains_supplement_review BOOLEAN,
  is_public_facing BOOLEAN,
  provider_id INTEGER,
  patient_id VARCHAR(32),
  charting_software_id INTEGER,
  PRIMARY KEY (clinical_documentation_id),
  FOREIGN KEY (provider_id) REFERENCES providers (provider_id),
  FOREIGN KEY (patient_id) REFERENCES patients (patient_id),
  FOREIGN KEY (charting_software_id) REFERENCES charting_softwares (id)
);
