CREATE TABLE victims_incidents (
  victim_id INTEGER NOT NULL,
  incident_id VARCHAR(32) NOT NULL,
  PRIMARY KEY (victim_id, incident_id),
  FOREIGN KEY (victim_id) REFERENCES victims (id),
  FOREIGN KEY (incident_id) REFERENCES domestic_violence_incidents (incident_id)
);
