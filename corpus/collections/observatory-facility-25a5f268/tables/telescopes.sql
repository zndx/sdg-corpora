CREATE TABLE telescopes (
  id INTEGER NOT NULL,
  telescope_id VARCHAR(44),
  telescope_name VARCHAR(32),
  aperture_meters DECIMAL,
  telescope_class VARCHAR(32),
  primary_instrument VARCHAR(32),
  observation_mode VARCHAR(32),
  community_access_percentage DECIMAL,
  funding_consortium VARCHAR(32),
  observatory_facility_id INTEGER,
  astronomical_survey_id INTEGER,
  managing_organization_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (observatory_facility_id) REFERENCES observatory_facilities (id),
  FOREIGN KEY (astronomical_survey_id) REFERENCES astronomical_surveys (astronomical_survey_id),
  FOREIGN KEY (managing_organization_id) REFERENCES managing_organizations (id)
);
