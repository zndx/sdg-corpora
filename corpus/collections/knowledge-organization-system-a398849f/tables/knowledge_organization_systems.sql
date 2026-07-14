CREATE TABLE knowledge_organization_systems (
  knowledge_organization_system_id INTEGER NOT NULL,
  identifier VARCHAR(32),
  name VARCHAR(32),
  version VARCHAR(32),
  last_updated TIMESTAMP,
  scope VARCHAR(32),
  status VARCHAR(32),
  tagging_activity_id INTEGER,
  PRIMARY KEY (knowledge_organization_system_id),
  FOREIGN KEY (tagging_activity_id) REFERENCES tagging_activities (id)
);
