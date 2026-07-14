CREATE TABLE authentication_methods (
  id INTEGER NOT NULL,
  auth_method_id VARCHAR(44),
  method_name VARCHAR(32),
  is_default BOOLEAN,
  requires_app_installation BOOLEAN,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (id)
);
