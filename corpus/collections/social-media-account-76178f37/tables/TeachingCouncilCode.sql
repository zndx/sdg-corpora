CREATE TABLE TeachingCouncilCode (
  id INTEGER NOT NULL,
  codeId VARCHAR(44),
  codeTitle INTEGER,
  issuingBody VARCHAR(32),
  effectiveDate DATE,
  sectionNumber VARCHAR(32),
  policyId INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (policyId) REFERENCES SocialMediaPolicy (policyId)
);
