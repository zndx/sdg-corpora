CREATE TABLE credit_hour_requirements (
  credit_hour_requirement_id INTEGER NOT NULL,
  requirement_id VARCHAR(38),
  credit_hours_required INTEGER,
  requirement_type VARCHAR(32),
  deadline_date DATE,
  status VARCHAR(32),
  certifying_officer_id INTEGER,
  compliance_coordinator_id INTEGER,
  term_id VARCHAR(32),
  PRIMARY KEY (credit_hour_requirement_id),
  FOREIGN KEY (certifying_officer_id) REFERENCES certifying_officers (id),
  FOREIGN KEY (compliance_coordinator_id) REFERENCES compliance_coordinators (id),
  FOREIGN KEY (term_id) REFERENCES academic_terms (term_id)
);
