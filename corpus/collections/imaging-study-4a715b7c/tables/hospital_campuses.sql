CREATE TABLE hospital_campuses (
  campus_code INTEGER NOT NULL,
  campus_name VARCHAR(32),
  bed_capacity INTEGER,
  trauma_level INTEGER,
  location VARCHAR(32),
  imaging_study_id INTEGER,
  radiologist_id INTEGER,
  thoracic_procedure_id INTEGER,
  PRIMARY KEY (campus_code),
  FOREIGN KEY (imaging_study_id) REFERENCES imaging_studies (id),
  FOREIGN KEY (radiologist_id) REFERENCES radiologists (id),
  FOREIGN KEY (thoracic_procedure_id) REFERENCES thoracic_procedures (thoracic_procedure_id)
);
