CREATE TABLE tax_registrations (
  registration_id INTEGER NOT NULL,
  issue_date DATE,
  expiry_date DATE,
  status VARCHAR(32),
  turnover_threshold DECIMAL,
  state_of_registration VARCHAR(32),
  application_submission_date TIMESTAMP,
  is_exempted BOOLEAN,
  trader_id INTEGER,
  jurisdiction_code VARCHAR(44),
  input_tax_credit_id INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (registration_id),
  FOREIGN KEY (trader_id) REFERENCES traders (id),
  FOREIGN KEY (jurisdiction_code) REFERENCES jurisdictions (jurisdiction_code),
  FOREIGN KEY (input_tax_credit_id) REFERENCES input_tax_credits (id)
);
