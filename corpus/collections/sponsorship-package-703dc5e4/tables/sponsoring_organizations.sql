CREATE TABLE sponsoring_organizations (
  org_id VARCHAR(32) NOT NULL,
  org_name VARCHAR(32),
  business_type VARCHAR(32),
  contact_email VARCHAR(32),
  contact_phone VARCHAR(32),
  membership_status VARCHAR(32),
  sponsorship_package_id INTEGER,
  conference_marketplace_id INTEGER,
  PRIMARY KEY (org_id),
  FOREIGN KEY (sponsorship_package_id) REFERENCES sponsorship_packages (id),
  FOREIGN KEY (conference_marketplace_id) REFERENCES conference_marketplaces (id)
);
