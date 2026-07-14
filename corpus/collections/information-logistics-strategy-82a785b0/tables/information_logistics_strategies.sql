CREATE TABLE information_logistics_strategies (
  id INTEGER NOT NULL,
  strategy_identifier VARCHAR(32),
  formulation_date TIMESTAMP,
  implementation_status VARCHAR(32),
  target_organizational_scope VARCHAR(32),
  alignment_with_i_t_strategy BOOLEAN,
  alignment_with_business_strategy BOOLEAN,
  empirical_study_id INTEGER,
  organizational_unit_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (empirical_study_id) REFERENCES empirical_studies (id),
  FOREIGN KEY (organizational_unit_id) REFERENCES organizational_units (organizational_unit_id)
);
