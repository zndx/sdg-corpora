CREATE TABLE learning_outcomes (
  outcome_id VARCHAR(32) NOT NULL,
  domain VARCHAR(32),
  objective_text VARCHAR(32),
  proficiency_level INTEGER,
  assessment_method VARCHAR(32),
  is_mandatory BOOLEAN,
  last_reviewed_date DATE,
  readiness_benchmark_id INTEGER,
  PRIMARY KEY (outcome_id),
  FOREIGN KEY (readiness_benchmark_id) REFERENCES readiness_benchmarks (id)
);
