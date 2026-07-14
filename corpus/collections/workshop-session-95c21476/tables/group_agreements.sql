CREATE TABLE group_agreements (
  group_agreement_id INTEGER NOT NULL,
  agreement_id VARCHAR(44),
  rule_description VARCHAR(32),
  is_enforced BOOLEAN,
  violation_count INTEGER,
  learning_environment_id INTEGER,
  PRIMARY KEY (group_agreement_id),
  FOREIGN KEY (learning_environment_id) REFERENCES learning_environments (learning_environment_id)
);
