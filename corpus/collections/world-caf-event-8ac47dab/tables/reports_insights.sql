CREATE TABLE reports_insights (
  project_report_id INTEGER NOT NULL,
  prevention_insight_id INTEGER NOT NULL,
  PRIMARY KEY (project_report_id, prevention_insight_id),
  FOREIGN KEY (project_report_id) REFERENCES project_reports (project_report_id),
  FOREIGN KEY (prevention_insight_id) REFERENCES prevention_insights (id)
);
