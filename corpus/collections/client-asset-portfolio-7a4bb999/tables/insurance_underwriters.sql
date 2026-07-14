CREATE TABLE insurance_underwriters (
  id INTEGER NOT NULL,
  underwriter_identifier VARCHAR(32),
  legal_name VARCHAR(32),
  location VARCHAR(32),
  credit_rating_s_p VARCHAR(32),
  credit_rating_a_m_best VARCHAR(32),
  credit_rating_fitch VARCHAR(32),
  rating_date DATE,
  insurance_policy_id INTEGER,
  rating_agency_id INTEGER,
  created_at TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (insurance_policy_id) REFERENCES insurance_policies (insurance_policy_id),
  FOREIGN KEY (rating_agency_id) REFERENCES rating_agencies (id)
);
