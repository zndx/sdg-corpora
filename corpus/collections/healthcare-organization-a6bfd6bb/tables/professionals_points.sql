CREATE TABLE professionals_points (
  healthcare_professional_id INTEGER NOT NULL,
  clinical_data_point_id INTEGER NOT NULL,
  PRIMARY KEY (healthcare_professional_id, clinical_data_point_id),
  FOREIGN KEY (healthcare_professional_id) REFERENCES healthcare_professionals (id),
  FOREIGN KEY (clinical_data_point_id) REFERENCES clinical_data_points (clinical_data_point_id)
);
