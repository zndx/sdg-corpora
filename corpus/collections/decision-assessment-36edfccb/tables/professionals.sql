CREATE TABLE professionals (
  id INTEGER NOT NULL,
  professional_id INTEGER,
  full_name VARCHAR(36),
  license_number VARCHAR(32),
  role_type VARCHAR(32),
  jurisdiction VARCHAR(32),
  PRIMARY KEY (id)
);
