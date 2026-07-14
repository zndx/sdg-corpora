CREATE TABLE service_agencies (
  agency_id VARCHAR(39) NOT NULL,
  agency_name VARCHAR(37),
  agency_type VARCHAR(32),
  has_specific_policy BOOLEAN,
  jurisdiction VARCHAR(32),
  adoption_of_social_model BOOLEAN,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (agency_id)
);
