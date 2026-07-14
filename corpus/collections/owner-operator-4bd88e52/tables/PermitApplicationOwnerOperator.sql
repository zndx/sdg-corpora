CREATE TABLE PermitApplicationOwnerOperator (
  applicationId VARCHAR(32) NOT NULL,
  operatorId INTEGER NOT NULL,
  PRIMARY KEY (applicationId, operatorId),
  FOREIGN KEY (applicationId) REFERENCES PermitApplication (applicationId),
  FOREIGN KEY (operatorId) REFERENCES OwnerOperator (id)
);
