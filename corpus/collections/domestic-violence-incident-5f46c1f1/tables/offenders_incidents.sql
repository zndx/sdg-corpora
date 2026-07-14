CREATE TABLE offenders_incidents (
  offender_id INTEGER NOT NULL,
  incident_id VARCHAR(32) NOT NULL,
  PRIMARY KEY (offender_id, incident_id),
  FOREIGN KEY (offender_id) REFERENCES offenders (id),
  FOREIGN KEY (incident_id) REFERENCES domestic_violence_incidents (incident_id)
);
