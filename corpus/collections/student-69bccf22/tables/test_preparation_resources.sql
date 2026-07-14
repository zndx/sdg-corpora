CREATE TABLE test_preparation_resources (
  test_preparation_resource_id INTEGER NOT NULL,
  test_prep_id VARCHAR(44),
  test_prep_name VARCHAR(32),
  requires_app_installation BOOLEAN,
  authentication_method_id INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (test_preparation_resource_id),
  FOREIGN KEY (authentication_method_id) REFERENCES authentication_methods (id)
);
