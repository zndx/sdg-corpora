CREATE TABLE biomarkers (
  biomarker_id INTEGER NOT NULL,
  biomarker_identifier VARCHAR(32),
  biomarker_name VARCHAR(32),
  biomarker_type VARCHAR(32),
  measurement_unit VARCHAR(32),
  normal_range VARCHAR(32),
  research_project_id INTEGER,
  health_condition_id INTEGER,
  created_at TIMESTAMP,
  PRIMARY KEY (biomarker_id),
  FOREIGN KEY (research_project_id) REFERENCES research_projects (research_project_id),
  FOREIGN KEY (health_condition_id) REFERENCES health_conditions (id)
);
