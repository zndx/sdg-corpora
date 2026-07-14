CREATE TABLE consolidation_impacts (
  consolidation_impact_id INTEGER NOT NULL,
  impact_id VARCHAR(44),
  cost_savings VARCHAR(32),
  salary_savings VARCHAR(32),
  position_count_change INTEGER,
  efficiency_gain BOOLEAN,
  requires_new_infrastructure BOOLEAN,
  mission_statement_id INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (consolidation_impact_id),
  FOREIGN KEY (mission_statement_id) REFERENCES mission_statements (id)
);
