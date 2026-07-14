CREATE TABLE AdmissionApplicationActivityEvidence (
  applicationId INTEGER NOT NULL,
  evidenceId INTEGER NOT NULL,
  PRIMARY KEY (applicationId, evidenceId),
  FOREIGN KEY (applicationId) REFERENCES AdmissionApplication (applicationId),
  FOREIGN KEY (evidenceId) REFERENCES ActivityEvidence (evidenceId)
);
