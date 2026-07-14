CREATE TABLE AssessmentNotice (
  id INTEGER NOT NULL,
  noticeIdentifier VARCHAR(32),
  propertyType VARCHAR(35),
  noticePeriod VARCHAR(32),
  taxYear INTEGER,
  status VARCHAR(32),
  issueDate DATE,
  parcelLandUseCode VARCHAR(32),
  appraiserId INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (parcelLandUseCode) REFERENCES PropertyParcel (landUseCode),
  FOREIGN KEY (appraiserId) REFERENCES ChiefAppraiser (appraiserId)
);
