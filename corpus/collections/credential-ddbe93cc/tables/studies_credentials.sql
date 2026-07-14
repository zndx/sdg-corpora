CREATE TABLE studies_credentials (
  program_of_study_id INTEGER NOT NULL,
  credential_id INTEGER NOT NULL,
  PRIMARY KEY (program_of_study_id, credential_id),
  FOREIGN KEY (program_of_study_id) REFERENCES program_of_studies (id),
  FOREIGN KEY (credential_id) REFERENCES credentials (credential_id)
);
