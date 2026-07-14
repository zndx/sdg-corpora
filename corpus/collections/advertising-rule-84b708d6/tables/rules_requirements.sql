CREATE TABLE rules_requirements (
  advertising_rule_id INTEGER NOT NULL,
  advertising_requirement_id INTEGER NOT NULL,
  PRIMARY KEY (advertising_rule_id, advertising_requirement_id),
  FOREIGN KEY (advertising_rule_id) REFERENCES advertising_rules (advertising_rule_id),
  FOREIGN KEY (advertising_requirement_id) REFERENCES advertising_requirements (advertising_requirement_id)
);
