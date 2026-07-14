CREATE TABLE instructional_resources (
  instructional_resource_id INTEGER NOT NULL,
  resource_id INTEGER,
  resource_name VARCHAR(32),
  category VARCHAR(32),
  requires_additional_login BOOLEAN,
  access_method VARCHAR(32),
  grade_range VARCHAR(32),
  authentication_method_id INTEGER,
  PRIMARY KEY (instructional_resource_id),
  FOREIGN KEY (authentication_method_id) REFERENCES authentication_methods (id)
);
