CREATE TABLE benchmarks_levels (
  readiness_benchmark_id INTEGER NOT NULL,
  course_level_id INTEGER NOT NULL,
  PRIMARY KEY (readiness_benchmark_id, course_level_id),
  FOREIGN KEY (readiness_benchmark_id) REFERENCES readiness_benchmarks (id),
  FOREIGN KEY (course_level_id) REFERENCES course_levels (course_level_id)
);
