CREATE TABLE NonComplianceIssue (
  id INTEGER NOT NULL,
  issueNumber INTEGER,
  description VARCHAR(32),
  dateRectified DATE,
  severity VARCHAR(32),
  itemId INTEGER,
  mechanicId INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (itemId) REFERENCES InspectionItem (itemId),
  FOREIGN KEY (mechanicId) REFERENCES QualifiedMechanic (mechanicId)
);
