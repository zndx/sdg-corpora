CREATE TABLE crisises_conditions (
  financial_crisis_id INTEGER NOT NULL,
  economic_condition_id INTEGER NOT NULL,
  PRIMARY KEY (financial_crisis_id, economic_condition_id),
  FOREIGN KEY (financial_crisis_id) REFERENCES financial_crisises (id),
  FOREIGN KEY (economic_condition_id) REFERENCES economic_conditions (id)
);
