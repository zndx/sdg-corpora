CREATE TABLE authorities_applications (
  regulatory_authority_id INTEGER NOT NULL,
  license_application_id INTEGER NOT NULL,
  PRIMARY KEY (regulatory_authority_id, license_application_id),
  FOREIGN KEY (regulatory_authority_id) REFERENCES regulatory_authorities (id),
  FOREIGN KEY (license_application_id) REFERENCES license_applications (license_application_id)
);
