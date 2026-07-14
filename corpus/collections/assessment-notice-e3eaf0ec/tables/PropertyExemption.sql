CREATE TABLE PropertyExemption (
  exemptionId INTEGER NOT NULL,
  exemptionIdentifier VARCHAR(32),
  exemptionType VARCHAR(32),
  taxYear INTEGER,
  reductionAmount VARCHAR(32),
  status VARCHAR(32),
  applicationDate DATE,
  parcelLandUseCode VARCHAR(32),
  assessorsId INTEGER,
  PRIMARY KEY (exemptionId),
  FOREIGN KEY (parcelLandUseCode) REFERENCES PropertyParcel (landUseCode),
  FOREIGN KEY (assessorsId) REFERENCES BoardOfAssessors (id)
);
