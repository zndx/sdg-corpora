CREATE TABLE profiles_benchmarks (
  student_profile_id INTEGER NOT NULL,
  readiness_benchmark_id INTEGER NOT NULL,
  PRIMARY KEY (student_profile_id, readiness_benchmark_id),
  FOREIGN KEY (student_profile_id) REFERENCES student_profiles (student_profile_id),
  FOREIGN KEY (readiness_benchmark_id) REFERENCES readiness_benchmarks (id)
);
