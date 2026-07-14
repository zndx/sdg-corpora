CREATE TABLE FacilityOwnerOperator (
  facilityZipCode VARCHAR(44) NOT NULL,
  operatorId INTEGER NOT NULL,
  PRIMARY KEY (facilityZipCode, operatorId),
  FOREIGN KEY (facilityZipCode) REFERENCES Facility (zipCode),
  FOREIGN KEY (operatorId) REFERENCES OwnerOperator (id)
);
