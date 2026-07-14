CREATE TABLE government_bodies (
  id INTEGER NOT NULL,
  body_id VARCHAR(32),
  body_name VARCHAR(32),
  jurisdiction_level VARCHAR(32),
  head_official VARCHAR(32),
  educational_organization_id INTEGER,
  award_id INTEGER,
  policy_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (educational_organization_id) REFERENCES educational_organizations (educational_organization_id),
  FOREIGN KEY (award_id) REFERENCES awards (award_id),
  FOREIGN KEY (policy_id) REFERENCES policies (policy_id)
);
