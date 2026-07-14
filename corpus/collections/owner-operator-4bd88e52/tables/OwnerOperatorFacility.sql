CREATE TABLE OwnerOperatorFacility (
  operatorId INTEGER NOT NULL,
  facilityZipCode VARCHAR(44) NOT NULL,
  PRIMARY KEY (operatorId, facilityZipCode),
  FOREIGN KEY (operatorId) REFERENCES OwnerOperator (id),
  FOREIGN KEY (facilityZipCode) REFERENCES Facility (zipCode)
);
