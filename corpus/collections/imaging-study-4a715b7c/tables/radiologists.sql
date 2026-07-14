CREATE TABLE radiologists (
  id INTEGER NOT NULL,
  physician_identifier VARCHAR(32),
  full_name VARCHAR(36),
  certification_body VARCHAR(32),
  specialization VARCHAR(32),
  employment_status VARCHAR(32),
  bilingual BOOLEAN,
  campus_code INTEGER,
  thoracic_procedure_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (campus_code) REFERENCES hospital_campuses (campus_code),
  FOREIGN KEY (thoracic_procedure_id) REFERENCES thoracic_procedures (thoracic_procedure_id)
);
