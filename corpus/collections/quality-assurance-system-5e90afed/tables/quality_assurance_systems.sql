CREATE TABLE quality_assurance_systems (
  quality_assurance_system_id INTEGER NOT NULL,
  system_identifier VARCHAR(32),
  implementation_date TIMESTAMP,
  status VARCHAR(32),
  region VARCHAR(32),
  framework_version VARCHAR(32),
  regional_commission_id INTEGER,
  academic_program_id INTEGER,
  quality_benchmark_id INTEGER,
  PRIMARY KEY (quality_assurance_system_id),
  FOREIGN KEY (regional_commission_id) REFERENCES regional_commissions (id),
  FOREIGN KEY (academic_program_id) REFERENCES academic_programs (academic_program_id),
  FOREIGN KEY (quality_benchmark_id) REFERENCES quality_benchmarks (id)
);
