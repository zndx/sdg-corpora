CREATE TABLE individuals_measurements (
  individual_participant_id VARCHAR(44) NOT NULL,
  measurement_id INTEGER NOT NULL,
  PRIMARY KEY (individual_participant_id, measurement_id),
  FOREIGN KEY (individual_participant_id) REFERENCES individuals (participant_id),
  FOREIGN KEY (measurement_id) REFERENCES biological_measurements (measurement_id)
);
