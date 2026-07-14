CREATE TABLE records_benchmarks (
  student_assessment_record_id INTEGER NOT NULL,
  readiness_benchmark_id INTEGER NOT NULL,
  PRIMARY KEY (student_assessment_record_id, readiness_benchmark_id),
  FOREIGN KEY (student_assessment_record_id) REFERENCES student_assessment_records (student_assessment_record_id),
  FOREIGN KEY (readiness_benchmark_id) REFERENCES readiness_benchmarks (id)
);
