CREATE TABLE teams_devices (
  clinical_engineering_team_id INTEGER NOT NULL,
  medical_device_model_number VARCHAR(32) NOT NULL,
  PRIMARY KEY (clinical_engineering_team_id, medical_device_model_number),
  FOREIGN KEY (clinical_engineering_team_id) REFERENCES clinical_engineering_teams (clinical_engineering_team_id),
  FOREIGN KEY (medical_device_model_number) REFERENCES medical_devices (model_number)
);
