CREATE TABLE non_profit_organizations (
  non_profit_organization_id INTEGER NOT NULL,
  organization_id VARCHAR(40),
  legal_name VARCHAR(32),
  tax_status VARCHAR(32),
  founding_date TIMESTAMP,
  headquarters_location VARCHAR(32),
  website_url VARCHAR(55),
  contact_phone_number VARCHAR(32),
  board_appointment_id INTEGER,
  has_affiliate_non_profit_organization_id INTEGER,
  funding_source_id INTEGER,
  PRIMARY KEY (non_profit_organization_id),
  FOREIGN KEY (board_appointment_id) REFERENCES board_appointments (board_appointment_id),
  FOREIGN KEY (has_affiliate_non_profit_organization_id) REFERENCES non_profit_organizations (non_profit_organization_id),
  FOREIGN KEY (funding_source_id) REFERENCES funding_sources (id)
);
