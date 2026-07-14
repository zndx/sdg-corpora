CREATE TABLE abuse_types (
  abuse_code VARCHAR(44) NOT NULL,
  definition VARCHAR(32),
  severity_level INTEGER,
  requires_mandatory_reporting BOOLEAN,
  classification VARCHAR(32),
  incident_id INTEGER,
  PRIMARY KEY (abuse_code),
  FOREIGN KEY (incident_id) REFERENCES incidents (id)
);
