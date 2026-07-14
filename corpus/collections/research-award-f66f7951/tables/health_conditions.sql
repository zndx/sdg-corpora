CREATE TABLE health_conditions (
  id INTEGER NOT NULL,
  condition_identifier VARCHAR(32),
  condition_name VARCHAR(32),
  condition_category VARCHAR(32),
  prevalence_rate DECIMAL,
  risk_factors VARCHAR(32),
  research_project_id INTEGER,
  biomarker_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (research_project_id) REFERENCES research_projects (research_project_id),
  FOREIGN KEY (biomarker_id) REFERENCES biomarkers (biomarker_id)
);
