CREATE TABLE imaging_studies (
  id INTEGER NOT NULL,
  study_identifier VARCHAR(32),
  modality VARCHAR(32),
  study_date TIMESTAMP,
  body_region VARCHAR(32),
  status VARCHAR(32),
  contrast_used BOOLEAN,
  campus_code INTEGER,
  radiologist_id INTEGER,
  post_processing_software_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (campus_code) REFERENCES hospital_campuses (campus_code),
  FOREIGN KEY (radiologist_id) REFERENCES radiologists (id),
  FOREIGN KEY (post_processing_software_id) REFERENCES post_processing_softwares (post_processing_software_id)
);
