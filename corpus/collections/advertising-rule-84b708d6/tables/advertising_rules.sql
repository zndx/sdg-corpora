CREATE TABLE advertising_rules (
  advertising_rule_id INTEGER NOT NULL,
  rule_number VARCHAR(32),
  rule_title VARCHAR(32),
  effective_date TIMESTAMP,
  status VARCHAR(32),
  section_identifier VARCHAR(32),
  advertisement_id INTEGER,
  PRIMARY KEY (advertising_rule_id),
  FOREIGN KEY (advertisement_id) REFERENCES advertisements (id)
);
