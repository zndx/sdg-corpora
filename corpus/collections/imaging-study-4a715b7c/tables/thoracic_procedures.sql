CREATE TABLE thoracic_procedures (
  thoracic_procedure_id INTEGER NOT NULL,
  procedure_code VARCHAR(44),
  procedure_name VARCHAR(32),
  procedure_date TIMESTAMP,
  invasiveness_level VARCHAR(32),
  status VARCHAR(32),
  radiologist_id INTEGER,
  campus_code INTEGER,
  imaging_study_id INTEGER,
  PRIMARY KEY (thoracic_procedure_id),
  FOREIGN KEY (radiologist_id) REFERENCES radiologists (id),
  FOREIGN KEY (campus_code) REFERENCES hospital_campuses (campus_code),
  FOREIGN KEY (imaging_study_id) REFERENCES imaging_studies (id)
);
