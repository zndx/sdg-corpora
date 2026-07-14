CREATE TABLE HuntingLicense (
  id INTEGER NOT NULL,
  licenseId VARCHAR(35),
  licenseType VARCHAR(32),
  issuingAuthority VARCHAR(32),
  feeAmount DECIMAL,
  issueDate DATE,
  expiryDate DATE,
  status VARCHAR(32),
  PRIMARY KEY (id)
);
