CREATE TABLE authorities_applications (
  authority_id INTEGER NOT NULL,
  planning_application_id INTEGER NOT NULL,
  PRIMARY KEY (authority_id, planning_application_id),
  FOREIGN KEY (authority_id) REFERENCES local_authorities (authority_id),
  FOREIGN KEY (planning_application_id) REFERENCES planning_applications (id)
);
