CREATE TABLE quality_benchmarks (
  id INTEGER NOT NULL,
  benchmark_id VARCHAR(35),
  metric_name VARCHAR(32),
  target_value DECIMAL,
  measurement_unit VARCHAR(32),
  evaluation_frequency VARCHAR(32),
  status VARCHAR(32),
  academic_program_id INTEGER,
  regional_commission_id INTEGER,
  expert_panel_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (academic_program_id) REFERENCES academic_programs (academic_program_id),
  FOREIGN KEY (regional_commission_id) REFERENCES regional_commissions (id),
  FOREIGN KEY (expert_panel_id) REFERENCES expert_panels (id)
);
