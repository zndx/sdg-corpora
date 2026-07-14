CREATE TABLE advertisements (
  id INTEGER NOT NULL,
  ad_identifier VARCHAR(32),
  media_type VARCHAR(32),
  publication_date DATE,
  compliance_status VARCHAR(32),
  language VARCHAR(32),
  fee_offered DECIMAL,
  fee_validity_days INTEGER,
  lawyer_id INTEGER,
  advertising_rule_id INTEGER,
  legal_claim_id INTEGER,
  disclaimer_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (lawyer_id) REFERENCES lawyers (id),
  FOREIGN KEY (advertising_rule_id) REFERENCES advertising_rules (advertising_rule_id),
  FOREIGN KEY (legal_claim_id) REFERENCES legal_claims (legal_claim_id),
  FOREIGN KEY (disclaimer_id) REFERENCES disclaimers (id)
);
