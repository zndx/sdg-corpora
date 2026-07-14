CREATE TABLE healths_dimensions (
  health_id VARCHAR(32) NOT NULL,
  workplace_culture_dimension_id INTEGER NOT NULL,
  PRIMARY KEY (health_id, workplace_culture_dimension_id),
  FOREIGN KEY (health_id) REFERENCES organizational_healths (health_id),
  FOREIGN KEY (workplace_culture_dimension_id) REFERENCES workplace_culture_dimensions (id)
);
