CREATE TABLE makers_factors (
  decision_maker_id INTEGER NOT NULL,
  success_factor_id INTEGER NOT NULL,
  PRIMARY KEY (decision_maker_id, success_factor_id),
  FOREIGN KEY (decision_maker_id) REFERENCES decision_makers (decision_maker_id),
  FOREIGN KEY (success_factor_id) REFERENCES success_factors (id)
);
