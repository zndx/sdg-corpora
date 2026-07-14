CREATE TABLE curriculum_resources (
  curriculum_id INTEGER NOT NULL,
  curriculum_name VARCHAR(32),
  subject_area VARCHAR(32),
  requires_additional_login BOOLEAN,
  authentication_method_id INTEGER,
  PRIMARY KEY (curriculum_id),
  FOREIGN KEY (authentication_method_id) REFERENCES authentication_methods (id)
);
