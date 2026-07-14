CREATE TABLE financial_assistances (
  financial_assistance_id INTEGER NOT NULL,
  assistance_id VARCHAR(44),
  amount DECIMAL,
  currency VARCHAR(32),
  disbursement_date TIMESTAMP,
  purpose VARCHAR(32),
  state_id INTEGER,
  received_by_state_id INTEGER,
  instrument_id VARCHAR(32),
  PRIMARY KEY (financial_assistance_id),
  FOREIGN KEY (state_id) REFERENCES states (id),
  FOREIGN KEY (received_by_state_id) REFERENCES states (id),
  FOREIGN KEY (instrument_id) REFERENCES environmental_policy_instruments (instrument_id)
);
