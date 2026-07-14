CREATE TABLE countries (
  country_id INTEGER NOT NULL,
  country_code VARCHAR(44),
  country_name VARCHAR(32),
  has_partner BOOLEAN,
  has_local_network BOOLEAN,
  partner_organization_id INTEGER,
  has_local_network_established_by_partner_organization_id INTEGER,
  PRIMARY KEY (country_id),
  FOREIGN KEY (partner_organization_id) REFERENCES partner_organizations (partner_organization_id),
  FOREIGN KEY (has_local_network_established_by_partner_organization_id) REFERENCES partner_organizations (partner_organization_id)
);
