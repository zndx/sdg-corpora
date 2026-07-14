CREATE TABLE prosecutors_incidents (
  prosecutor_id INTEGER NOT NULL,
  incident_id VARCHAR(32) NOT NULL,
  PRIMARY KEY (prosecutor_id, incident_id),
  FOREIGN KEY (prosecutor_id) REFERENCES prosecutors (id),
  FOREIGN KEY (incident_id) REFERENCES domestic_violence_incidents (incident_id)
);
