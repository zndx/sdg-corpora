CREATE TABLE methods_resources (
  authentication_method_id INTEGER NOT NULL,
  instructional_resource_id INTEGER NOT NULL,
  PRIMARY KEY (authentication_method_id, instructional_resource_id),
  FOREIGN KEY (authentication_method_id) REFERENCES authentication_methods (id),
  FOREIGN KEY (instructional_resource_id) REFERENCES instructional_resources (instructional_resource_id)
);
