CREATE TABLE datasets_measurements (
  dataset_id INTEGER NOT NULL,
  measurement_id INTEGER NOT NULL,
  PRIMARY KEY (dataset_id, measurement_id),
  FOREIGN KEY (dataset_id) REFERENCES datasets (id),
  FOREIGN KEY (measurement_id) REFERENCES biological_measurements (measurement_id)
);
