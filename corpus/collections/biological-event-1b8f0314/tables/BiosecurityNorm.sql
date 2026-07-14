CREATE TABLE BiosecurityNorm (
  normID VARCHAR(32) NOT NULL,
  normName VARCHAR(32),
  issuingBody VARCHAR(32),
  effectiveDate DATE,
  enforcementLevel VARCHAR(32),
  complianceRate DECIMAL,
  facilityID VARCHAR(32),
  eventId INTEGER,
  mechanismId INTEGER,
  PRIMARY KEY (normID),
  FOREIGN KEY (facilityID) REFERENCES ResearchFacility (facilityID),
  FOREIGN KEY (eventId) REFERENCES BiologicalEvent (eventId),
  FOREIGN KEY (mechanismId) REFERENCES CatalyticFinancingMechanism (mechanismId)
);
