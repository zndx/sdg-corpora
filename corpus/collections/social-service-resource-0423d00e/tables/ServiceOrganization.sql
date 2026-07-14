CREATE TABLE ServiceOrganization (
  id INTEGER NOT NULL,
  organizationIdentifier VARCHAR(36),
  organizationName VARCHAR(32),
  jurisdiction VARCHAR(32),
  isGovernmentAgency VARCHAR(52),
  websiteUrl VARCHAR(55),
  PRIMARY KEY (id)
);
