CREATE TABLE EducationalInstitutionStaffMember (
  institutionId INTEGER NOT NULL,
  memberId INTEGER NOT NULL,
  PRIMARY KEY (institutionId, memberId),
  FOREIGN KEY (institutionId) REFERENCES EducationalInstitution (institutionId),
  FOREIGN KEY (memberId) REFERENCES StaffMember (memberId)
);
