CREATE TABLE coordinators_requirements (
  compliance_coordinator_id INTEGER NOT NULL,
  credit_hour_requirement_id INTEGER NOT NULL,
  PRIMARY KEY (compliance_coordinator_id, credit_hour_requirement_id),
  FOREIGN KEY (compliance_coordinator_id) REFERENCES compliance_coordinators (id),
  FOREIGN KEY (credit_hour_requirement_id) REFERENCES credit_hour_requirements (credit_hour_requirement_id)
);
