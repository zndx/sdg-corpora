CREATE TABLE scoring_rules (
  id INTEGER NOT NULL,
  rule_identifier VARCHAR(32),
  required_points INTEGER,
  points_awarded DECIMAL,
  condition_type VARCHAR(32),
  penalty_applied BOOLEAN,
  assessment_item_id INTEGER,
  answer_key_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (assessment_item_id) REFERENCES assessment_items (id),
  FOREIGN KEY (answer_key_id) REFERENCES answer_keys (id)
);
