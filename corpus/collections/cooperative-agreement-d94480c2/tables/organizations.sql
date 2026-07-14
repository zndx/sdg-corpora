CREATE TABLE organizations (
  id INTEGER NOT NULL,
  organization_identifier VARCHAR(53),
  organization_name VARCHAR(57),
  legal_status VARCHAR(32),
  headquarters_location VARCHAR(32),
  website_url VARCHAR(65),
  cooperative_agreement_id INTEGER,
  individual_id INTEGER,
  conference_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (cooperative_agreement_id) REFERENCES cooperative_agreements (cooperative_agreement_id),
  FOREIGN KEY (individual_id) REFERENCES individuals (individual_id),
  FOREIGN KEY (conference_id) REFERENCES conferences (conference_id)
);
