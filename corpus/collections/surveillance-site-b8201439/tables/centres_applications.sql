CREATE TABLE centres_applications (
  control_centre_id INTEGER NOT NULL,
  monitoring_application_id INTEGER NOT NULL,
  PRIMARY KEY (control_centre_id, monitoring_application_id),
  FOREIGN KEY (control_centre_id) REFERENCES control_centres (id),
  FOREIGN KEY (monitoring_application_id) REFERENCES monitoring_applications (monitoring_application_id)
);
