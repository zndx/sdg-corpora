CREATE TABLE incidents_types (
  incident_id INTEGER NOT NULL,
  abuse_type_abuse_code VARCHAR(44) NOT NULL,
  PRIMARY KEY (incident_id, abuse_type_abuse_code),
  FOREIGN KEY (incident_id) REFERENCES incidents (id),
  FOREIGN KEY (abuse_type_abuse_code) REFERENCES abuse_types (abuse_code)
);
