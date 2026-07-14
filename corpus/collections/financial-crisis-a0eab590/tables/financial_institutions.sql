CREATE TABLE financial_institutions (
  id INTEGER NOT NULL,
  institution_name VARCHAR(32),
  institution_type VARCHAR(32),
  asset_size DECIMAL,
  currency VARCHAR(32),
  risk_rating VARCHAR(32),
  is_systemically_important BOOLEAN,
  bailout_program_id INTEGER,
  government_agency_id INTEGER,
  economic_condition_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (bailout_program_id) REFERENCES bailout_programs (bailout_program_id),
  FOREIGN KEY (government_agency_id) REFERENCES government_agencies (id),
  FOREIGN KEY (economic_condition_id) REFERENCES economic_conditions (id)
);
