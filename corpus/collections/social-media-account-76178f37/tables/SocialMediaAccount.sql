CREATE TABLE SocialMediaAccount (
  accountId VARCHAR(44) NOT NULL,
  platformName VARCHAR(32),
  accountType VARCHAR(32),
  creationDate TIMESTAMP,
  status VARCHAR(32),
  lastLoginDate TIMESTAMP,
  passwordHash VARCHAR(32),
  memberId INTEGER,
  registerId INTEGER,
  policyId INTEGER,
  PRIMARY KEY (accountId),
  FOREIGN KEY (memberId) REFERENCES StaffMember (memberId),
  FOREIGN KEY (registerId) REFERENCES AccountRegister (registerId),
  FOREIGN KEY (policyId) REFERENCES SocialMediaPolicy (policyId)
);
