CREATE TABLE OwnerOperatorPermitApplication (
  operatorId INTEGER NOT NULL,
  applicationId VARCHAR(32) NOT NULL,
  PRIMARY KEY (operatorId, applicationId),
  FOREIGN KEY (operatorId) REFERENCES OwnerOperator (id),
  FOREIGN KEY (applicationId) REFERENCES PermitApplication (applicationId)
);
