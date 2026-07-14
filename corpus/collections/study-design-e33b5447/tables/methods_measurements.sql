CREATE TABLE methods_measurements (
  research_method_id INTEGER NOT NULL,
  measurement_id INTEGER NOT NULL,
  PRIMARY KEY (research_method_id, measurement_id),
  FOREIGN KEY (research_method_id) REFERENCES research_methods (id),
  FOREIGN KEY (measurement_id) REFERENCES biological_measurements (measurement_id)
);
