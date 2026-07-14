CREATE TABLE BioscienceAdvancement (
  id INTEGER NOT NULL,
  advancementID VARCHAR(32),
  technologyType VARCHAR(32),
  riskLevel VARCHAR(32),
  implementationDate DATE,
  dualUsePotential BOOLEAN,
  technicalBarrierLevel DECIMAL,
  eventId INTEGER,
  facilityID VARCHAR(32),
  normID VARCHAR(32),
  PRIMARY KEY (id),
  FOREIGN KEY (eventId) REFERENCES BiologicalEvent (eventId),
  FOREIGN KEY (facilityID) REFERENCES ResearchFacility (facilityID),
  FOREIGN KEY (normID) REFERENCES BiosecurityNorm (normID)
);
