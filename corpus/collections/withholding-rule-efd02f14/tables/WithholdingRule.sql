CREATE TABLE WithholdingRule (
  id INTEGER NOT NULL,
  ruleIdentifier VARCHAR(32),
  effectiveDate DATE,
  withholdingRate DECIMAL,
  paymentThreshold DECIMAL,
  status VARCHAR(32),
  issuingAgency VARCHAR(44),
  statuteId INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (statuteId) REFERENCES Statute (statuteId)
);
