CREATE TABLE AccountRegister (
  registerId INTEGER NOT NULL,
  institutionId INTEGER,
  lastAuditDate TIMESTAMP,
  totalActiveAccounts INTEGER,
  complianceStatus VARCHAR(32),
  recordFormat VARCHAR(32),
  maintainedByInstitutionId INTEGER,
  memberId INTEGER,
  PRIMARY KEY (registerId),
  FOREIGN KEY (maintainedByInstitutionId) REFERENCES EducationalInstitution (institutionId),
  FOREIGN KEY (memberId) REFERENCES StaffMember (memberId)
);
