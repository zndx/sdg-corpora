CREATE TABLE disclaimers (
  id INTEGER NOT NULL,
  disclaimer_text VARCHAR(32),
  disclaimer_type VARCHAR(32),
  prominence_level VARCHAR(32),
  is_mandatory BOOLEAN,
  advertisement_id INTEGER,
  advertising_rule_id INTEGER,
  created_at TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (advertisement_id) REFERENCES advertisements (id),
  FOREIGN KEY (advertising_rule_id) REFERENCES advertising_rules (advertising_rule_id)
);
