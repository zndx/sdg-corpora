CREATE TABLE public_objections (
  objection_id VARCHAR(44) NOT NULL,
  submission_date DATE,
  objection_reason VARCHAR(32),
  severity VARCHAR(32),
  is_formal BOOLEAN,
  planning_application_id INTEGER,
  PRIMARY KEY (objection_id),
  FOREIGN KEY (planning_application_id) REFERENCES planning_applications (id)
);
