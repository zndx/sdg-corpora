CREATE TABLE InspectionItem (
  itemId INTEGER NOT NULL,
  itemName VARCHAR(32),
  systemCategory VARCHAR(34),
  complianceStatus VARCHAR(32),
  defectDescription VARCHAR(32),
  rectificationDate DATE,
  vehicleId INTEGER,
  recordId INTEGER,
  issueId INTEGER,
  PRIMARY KEY (itemId),
  FOREIGN KEY (vehicleId) REFERENCES Vehicle (id),
  FOREIGN KEY (recordId) REFERENCES VehicleInspectionRecord (id),
  FOREIGN KEY (issueId) REFERENCES NonComplianceIssue (id)
);
