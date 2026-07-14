CREATE TABLE provider_roles (
  provider_role_id INTEGER NOT NULL,
  role_code VARCHAR(32),
  role_name VARCHAR(32),
  is_clinical BOOLEAN,
  provider_change_request_id INTEGER,
  created_at TIMESTAMP,
  PRIMARY KEY (provider_role_id),
  FOREIGN KEY (provider_change_request_id) REFERENCES provider_change_requests (provider_change_request_id)
);
