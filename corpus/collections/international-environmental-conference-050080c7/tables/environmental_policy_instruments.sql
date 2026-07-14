CREATE TABLE environmental_policy_instruments (
  instrument_id VARCHAR(32) NOT NULL,
  name VARCHAR(32),
  type VARCHAR(32),
  implementation_date TIMESTAMP,
  target_sector VARCHAR(32),
  multilateral_environmental_agreement_id INTEGER,
  state_id INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (instrument_id),
  FOREIGN KEY (multilateral_environmental_agreement_id) REFERENCES multilateral_environmental_agreements (multilateral_environmental_agreement_id),
  FOREIGN KEY (state_id) REFERENCES states (id)
);
