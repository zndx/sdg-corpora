CREATE TABLE specializations_educators (
  specialization_id INTEGER NOT NULL,
  educator_id INTEGER NOT NULL,
  PRIMARY KEY (specialization_id, educator_id),
  FOREIGN KEY (specialization_id) REFERENCES specializations (specialization_id),
  FOREIGN KEY (educator_id) REFERENCES educators (id)
);
