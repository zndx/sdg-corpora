CREATE TABLE domestic_violence_incidents (
  incident_id VARCHAR(32) NOT NULL,
  report_date TIMESTAMP,
  severity_level VARCHAR(32),
  location VARCHAR(32),
  offender_id INTEGER,
  victim_id VARCHAR(44),
  police_report_number VARCHAR(32),
  lethality_score DECIMAL,
  police_report_id INTEGER,
  involves_victim_victim_id INTEGER,
  involves_offender_offender_id INTEGER,
  PRIMARY KEY (incident_id),
  FOREIGN KEY (police_report_id) REFERENCES police_reports (id),
  FOREIGN KEY (involves_victim_victim_id) REFERENCES victims (id),
  FOREIGN KEY (involves_offender_offender_id) REFERENCES offenders (id)
);
