CREATE TABLE PropertyParcel (
  parcelIdentifier VARCHAR(32),
  address VARCHAR(32),
  landUseCode VARCHAR(32) NOT NULL,
  assessedValue DECIMAL,
  taxYear INTEGER,
  isHomesteaded BOOLEAN,
  noticeId INTEGER,
  exemptionId INTEGER,
  PRIMARY KEY (landUseCode),
  FOREIGN KEY (noticeId) REFERENCES AssessmentNotice (id),
  FOREIGN KEY (exemptionId) REFERENCES PropertyExemption (exemptionId)
);
