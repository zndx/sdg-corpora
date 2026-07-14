CREATE TABLE professionals_activities (
  healthcare_professional_id INTEGER NOT NULL,
  measurement_activity_id INTEGER NOT NULL,
  PRIMARY KEY (healthcare_professional_id, measurement_activity_id),
  FOREIGN KEY (healthcare_professional_id) REFERENCES healthcare_professionals (healthcare_professional_id),
  FOREIGN KEY (measurement_activity_id) REFERENCES measurement_activities (id)
);
