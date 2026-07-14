CREATE TABLE PermitApplication (
  applicationId VARCHAR(32) NOT NULL,
  applicationDate TIMESTAMP,
  permitType VARCHAR(38),
  reasonCode VARCHAR(32),
  feeAmount DECIMAL,
  preparedBy VARCHAR(32),
  preparedByCompany VARCHAR(35),
  preparedByPhone VARCHAR(32),
  preparedByEmail VARCHAR(32),
  facilityZipCode VARCHAR(44),
  operatorId INTEGER,
  permitId INTEGER,
  PRIMARY KEY (applicationId),
  FOREIGN KEY (facilityZipCode) REFERENCES Facility (zipCode),
  FOREIGN KEY (operatorId) REFERENCES OwnerOperator (id),
  FOREIGN KEY (permitId) REFERENCES OtherPermit (id)
);
