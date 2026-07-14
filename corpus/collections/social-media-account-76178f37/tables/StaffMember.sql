CREATE TABLE StaffMember (
  memberId INTEGER NOT NULL,
  staffId INTEGER,
  fullName VARCHAR(36),
  employmentStatus VARCHAR(32),
  role VARCHAR(32),
  dateOfCommencement DATE,
  emailAddress VARCHAR(32),
  department VARCHAR(32),
  accountId VARCHAR(44),
  institutionId INTEGER,
  codeId INTEGER,
  PRIMARY KEY (memberId),
  FOREIGN KEY (accountId) REFERENCES SocialMediaAccount (accountId),
  FOREIGN KEY (institutionId) REFERENCES EducationalInstitution (institutionId),
  FOREIGN KEY (codeId) REFERENCES TeachingCouncilCode (id)
);
