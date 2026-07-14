CREATE TABLE fee_schedules (
  id INTEGER NOT NULL,
  application_fee DECIMAL,
  initial_license_fee DECIMAL,
  annual_renewal_fee DECIMAL,
  currency VARCHAR(32),
  regulatory_authority_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (regulatory_authority_id) REFERENCES regulatory_authorities (id)
);
