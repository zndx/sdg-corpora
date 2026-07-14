CREATE TABLE levels_benchmarks (
  course_level_id INTEGER NOT NULL,
  readiness_benchmark_id INTEGER NOT NULL,
  PRIMARY KEY (course_level_id, readiness_benchmark_id),
  FOREIGN KEY (course_level_id) REFERENCES course_levels (course_level_id),
  FOREIGN KEY (readiness_benchmark_id) REFERENCES readiness_benchmarks (id)
);
