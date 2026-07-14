CREATE TABLE AccreditationScope (
  scopeId INTEGER NOT NULL,
  scopeTitle VARCHAR(32),
  technicalDomain VARCHAR(32),
  isOnSiteAvailable BOOLEAN,
  scopeVersion VARCHAR(32),
  certificateId INTEGER,
  PRIMARY KEY (scopeId),
  FOREIGN KEY (certificateId) REFERENCES AccreditationCertificate (id)
);
