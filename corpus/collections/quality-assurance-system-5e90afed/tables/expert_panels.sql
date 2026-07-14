CREATE TABLE expert_panels (
  id INTEGER NOT NULL,
  panel_id INTEGER,
  panel_name VARCHAR(32),
  expertise_domain VARCHAR(32),
  commissioning_body VARCHAR(32),
  panel_status VARCHAR(32),
  regional_commission_id INTEGER,
  quality_benchmark_id INTEGER,
  university_code VARCHAR(44),
  PRIMARY KEY (id),
  FOREIGN KEY (regional_commission_id) REFERENCES regional_commissions (id),
  FOREIGN KEY (quality_benchmark_id) REFERENCES quality_benchmarks (id),
  FOREIGN KEY (university_code) REFERENCES universities (university_code)
);
