CREATE TABLE i_p_a_c_measures (
  id INTEGER NOT NULL,
  measure_id VARCHAR(32),
  measure_name VARCHAR(32),
  description VARCHAR(32),
  implementation_date DATE,
  compliance_status VARCHAR(32),
  last_reviewed_date DATE,
  school_id INTEGER,
  public_health_nurse_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (school_id) REFERENCES schools (id),
  FOREIGN KEY (public_health_nurse_id) REFERENCES public_health_nurses (id)
);
