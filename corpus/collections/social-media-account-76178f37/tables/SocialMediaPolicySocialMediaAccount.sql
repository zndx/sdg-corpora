CREATE TABLE SocialMediaPolicySocialMediaAccount (
  policyId INTEGER NOT NULL,
  accountId VARCHAR(44) NOT NULL,
  PRIMARY KEY (policyId, accountId),
  FOREIGN KEY (policyId) REFERENCES SocialMediaPolicy (policyId),
  FOREIGN KEY (accountId) REFERENCES SocialMediaAccount (accountId)
);
