CREATE TABLE netting_agreements (
  id INTEGER NOT NULL,
  agreement_identifier VARCHAR(32),
  agreement_type VARCHAR(32),
  enforceability_review_status VARCHAR(32),
  reviewed_by VARCHAR(32),
  effective_date TIMESTAMP,
  termination_date TIMESTAMP,
  regulatory_instrument_id INTEGER,
  created_at TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (regulatory_instrument_id) REFERENCES regulatory_instruments (regulatory_instrument_id)
);
