CREATE TABLE officers_requirements (
  certifying_officer_id INTEGER NOT NULL,
  credit_hour_requirement_id INTEGER NOT NULL,
  PRIMARY KEY (certifying_officer_id, credit_hour_requirement_id),
  FOREIGN KEY (certifying_officer_id) REFERENCES certifying_officers (id),
  FOREIGN KEY (credit_hour_requirement_id) REFERENCES credit_hour_requirements (credit_hour_requirement_id)
);
