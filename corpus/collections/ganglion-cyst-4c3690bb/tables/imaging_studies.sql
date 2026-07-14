CREATE TABLE imaging_studies (
  id INTEGER NOT NULL,
  study_id VARCHAR(32),
  study_date TIMESTAMP,
  modality VARCHAR(32),
  is_diagnostic BOOLEAN,
  findings_description VARCHAR(32),
  ganglion_cyst_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (ganglion_cyst_id) REFERENCES ganglion_cysts (id)
);
