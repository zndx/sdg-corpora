CREATE TABLE readiness_benchmarks (
  id INTEGER NOT NULL,
  benchmark_id VARCHAR(35),
  assessment_domain VARCHAR(34),
  minimum_score DECIMAL,
  assessment_type VARCHAR(32),
  effective_date DATE,
  expiration_months INTEGER,
  is_mandatory BOOLEAN,
  score_scale VARCHAR(32),
  instrument_code INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (instrument_code) REFERENCES assessment_instruments (instrument_code)
);
