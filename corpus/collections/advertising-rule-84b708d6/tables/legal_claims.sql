CREATE TABLE legal_claims (
  legal_claim_id INTEGER NOT NULL,
  claim_text VARCHAR(32),
  claim_type VARCHAR(32),
  is_verifiable BOOLEAN,
  is_misleading BOOLEAN,
  requires_disclaimer BOOLEAN,
  disclaimer_text VARCHAR(32),
  advertisement_id INTEGER,
  advertising_rule_id INTEGER,
  PRIMARY KEY (legal_claim_id),
  FOREIGN KEY (advertisement_id) REFERENCES advertisements (id),
  FOREIGN KEY (advertising_rule_id) REFERENCES advertising_rules (advertising_rule_id)
);
