CREATE TABLE applications_objections (
  planning_application_id INTEGER NOT NULL,
  objection_id VARCHAR(44) NOT NULL,
  PRIMARY KEY (planning_application_id, objection_id),
  FOREIGN KEY (planning_application_id) REFERENCES planning_applications (id),
  FOREIGN KEY (objection_id) REFERENCES public_objections (objection_id)
);
