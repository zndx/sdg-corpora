CREATE TABLE activities_microenterprises (
  project_activity_id INTEGER NOT NULL,
  microenterprise_id INTEGER NOT NULL,
  PRIMARY KEY (project_activity_id, microenterprise_id),
  FOREIGN KEY (project_activity_id) REFERENCES project_activities (id),
  FOREIGN KEY (microenterprise_id) REFERENCES microenterprises (microenterprise_id)
);
