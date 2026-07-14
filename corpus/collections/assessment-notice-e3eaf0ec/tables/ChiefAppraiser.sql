CREATE TABLE ChiefAppraiser (
  appraiserId INTEGER NOT NULL,
  appraiserIdentifier VARCHAR(32),
  appointmentDate DATE,
  currentTermEnd DATE,
  officeLocation VARCHAR(32),
  noticeId INTEGER,
  exemptionId INTEGER,
  assessorsId INTEGER,
  PRIMARY KEY (appraiserId),
  FOREIGN KEY (noticeId) REFERENCES AssessmentNotice (id),
  FOREIGN KEY (exemptionId) REFERENCES PropertyExemption (exemptionId),
  FOREIGN KEY (assessorsId) REFERENCES BoardOfAssessors (id)
);
