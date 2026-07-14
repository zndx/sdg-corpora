CREATE TABLE post_processing_softwares (
  post_processing_software_id INTEGER NOT NULL,
  software_name VARCHAR(32),
  version VARCHAR(32),
  vendor VARCHAR(32),
  license_status VARCHAR(32),
  imaging_study_id INTEGER,
  PRIMARY KEY (post_processing_software_id),
  FOREIGN KEY (imaging_study_id) REFERENCES imaging_studies (id)
);
