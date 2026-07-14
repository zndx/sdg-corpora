CREATE TABLE SocietyCharter (
  id INTEGER NOT NULL,
  legalName VARCHAR(32),
  principalOfficeAddress VARCHAR(32),
  registeredOfficeAddress VARCHAR(32),
  jurisdictionState VARCHAR(32),
  charitablePurposeStatement VARCHAR(32),
  PRIMARY KEY (id)
);
