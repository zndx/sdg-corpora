CREATE TABLE hotline_services (
  hotline_identifier VARCHAR(32),
  phone_number VARCHAR(32) NOT NULL,
  text_keyword VARCHAR(32),
  availability_schedule VARCHAR(32),
  is_free BOOLEAN,
  is_confidential BOOLEAN,
  service_organization_id INTEGER,
  social_issue_id INTEGER,
  social_service_resource_id INTEGER,
  PRIMARY KEY (phone_number),
  FOREIGN KEY (service_organization_id) REFERENCES service_organizations (id),
  FOREIGN KEY (social_issue_id) REFERENCES social_issues (social_issue_id),
  FOREIGN KEY (social_service_resource_id) REFERENCES social_service_resources (social_service_resource_id)
);
