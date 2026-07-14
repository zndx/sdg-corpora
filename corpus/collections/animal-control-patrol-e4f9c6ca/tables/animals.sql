CREATE TABLE animals (
  id INTEGER NOT NULL,
  animal_id INTEGER,
  species VARCHAR(32),
  breed VARCHAR(32),
  age INTEGER,
  weight DECIMAL,
  health_status VARCHAR(32),
  temperament VARCHAR(32),
  impound_status VARCHAR(32),
  incident_report_id INTEGER,
  adoption_assessment_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (incident_report_id) REFERENCES incident_reports (id),
  FOREIGN KEY (adoption_assessment_id) REFERENCES adoption_assessments (id)
);
