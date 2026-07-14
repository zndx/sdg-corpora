CREATE TABLE outbreaks (
  outbreak_id VARCHAR(32) NOT NULL,
  start_date DATE,
  end_date DATE,
  case_count INTEGER,
  status VARCHAR(32),
  location VARCHAR(32),
  school_id INTEGER,
  public_health_nurse_id INTEGER,
  created_at TIMESTAMP,
  PRIMARY KEY (outbreak_id),
  FOREIGN KEY (school_id) REFERENCES schools (id),
  FOREIGN KEY (public_health_nurse_id) REFERENCES public_health_nurses (id)
);
