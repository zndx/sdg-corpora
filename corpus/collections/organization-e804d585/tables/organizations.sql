CREATE TABLE organizations (
  organization_id INTEGER NOT NULL,
  organization_name VARCHAR(32),
  registration_status VARCHAR(42),
  organization_type VARCHAR(32),
  contact_phone_number VARCHAR(32),
  website_url VARCHAR(55),
  gambling_activity_id INTEGER,
  PRIMARY KEY (organization_id),
  FOREIGN KEY (gambling_activity_id) REFERENCES gambling_activities (id)
);
