CREATE TABLE advertising_requirements (
  advertising_requirement_id INTEGER NOT NULL,
  requirement_text VARCHAR(32),
  requirement_category VARCHAR(32),
  is_safe_harbor BOOLEAN,
  applies_to_media VARCHAR(32),
  advertising_rule_id INTEGER,
  advertisement_id INTEGER,
  PRIMARY KEY (advertising_requirement_id),
  FOREIGN KEY (advertising_rule_id) REFERENCES advertising_rules (advertising_rule_id),
  FOREIGN KEY (advertisement_id) REFERENCES advertisements (id)
);
