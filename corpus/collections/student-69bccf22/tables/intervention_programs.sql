CREATE TABLE intervention_programs (
  id INTEGER NOT NULL,
  intervention_id VARCHAR(44),
  intervention_name VARCHAR(32),
  subject_area VARCHAR(32),
  grade_range VARCHAR(32),
  requires_app_installation BOOLEAN,
  authentication_method_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (authentication_method_id) REFERENCES authentication_methods (id)
);
