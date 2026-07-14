CREATE TABLE SocialMediaPolicy (
  policyId INTEGER NOT NULL,
  title VARCHAR(32),
  adoptionDate DATE,
  version VARCHAR(32),
  issuingAuthority VARCHAR(32),
  scope VARCHAR(32),
  codeId INTEGER,
  PRIMARY KEY (policyId),
  FOREIGN KEY (codeId) REFERENCES TeachingCouncilCode (id)
);
