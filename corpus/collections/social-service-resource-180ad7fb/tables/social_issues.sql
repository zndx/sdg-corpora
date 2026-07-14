CREATE TABLE social_issues (
  social_issue_id INTEGER NOT NULL,
  issue_category VARCHAR(32),
  severity_level VARCHAR(32),
  requires_law_enforcement BOOLEAN,
  hotline_service_phone_number VARCHAR(32),
  social_service_resource_id INTEGER,
  PRIMARY KEY (social_issue_id),
  FOREIGN KEY (hotline_service_phone_number) REFERENCES hotline_services (phone_number),
  FOREIGN KEY (social_service_resource_id) REFERENCES social_service_resources (social_service_resource_id)
);
