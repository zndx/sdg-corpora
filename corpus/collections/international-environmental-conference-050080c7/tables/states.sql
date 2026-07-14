CREATE TABLE states (
  id INTEGER NOT NULL,
  state_code INTEGER,
  name VARCHAR(32),
  development_status VARCHAR(32),
  primary_environmental_concern VARCHAR(32),
  instrument_id VARCHAR(32),
  multilateral_environmental_agreement_id INTEGER,
  financial_assistance_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (instrument_id) REFERENCES environmental_policy_instruments (instrument_id),
  FOREIGN KEY (multilateral_environmental_agreement_id) REFERENCES multilateral_environmental_agreements (multilateral_environmental_agreement_id),
  FOREIGN KEY (financial_assistance_id) REFERENCES financial_assistances (financial_assistance_id)
);
