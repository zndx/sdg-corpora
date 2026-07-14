CREATE TABLE providers (
  provider_id INTEGER NOT NULL,
  specialty VARCHAR(32),
  contact_number VARCHAR(32),
  created_at TIMESTAMP,
  PRIMARY KEY (provider_id)
);
