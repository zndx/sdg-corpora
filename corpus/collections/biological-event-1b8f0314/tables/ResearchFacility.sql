CREATE TABLE ResearchFacility (
  facilityID VARCHAR(32) NOT NULL,
  facilityName VARCHAR(32),
  locationCountry VARCHAR(32),
  biosafetyLevel INTEGER,
  operationalStatus VARCHAR(32),
  lastInspectionDate DATE,
  accidentRate DECIMAL,
  advancementId INTEGER,
  normID VARCHAR(32),
  PRIMARY KEY (facilityID),
  FOREIGN KEY (advancementId) REFERENCES BioscienceAdvancement (id),
  FOREIGN KEY (normID) REFERENCES BiosecurityNorm (normID)
);
