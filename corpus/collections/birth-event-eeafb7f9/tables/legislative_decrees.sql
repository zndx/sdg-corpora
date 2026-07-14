CREATE TABLE legislative_decrees (
  id INTEGER NOT NULL,
  issuer_name VARCHAR(32),
  issuance_date DATE,
  mandate_description VARCHAR(32),
  objective VARCHAR(32),
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (id)
);
