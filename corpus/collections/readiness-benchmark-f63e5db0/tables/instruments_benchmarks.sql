CREATE TABLE instruments_benchmarks (
  instrument_code INTEGER NOT NULL,
  readiness_benchmark_id INTEGER NOT NULL,
  PRIMARY KEY (instrument_code, readiness_benchmark_id),
  FOREIGN KEY (instrument_code) REFERENCES assessment_instruments (instrument_code),
  FOREIGN KEY (readiness_benchmark_id) REFERENCES readiness_benchmarks (id)
);
