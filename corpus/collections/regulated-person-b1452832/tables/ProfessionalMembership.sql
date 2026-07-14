CREATE TABLE ProfessionalMembership (
  organizationName VARCHAR(32),
  membershipStatus VARCHAR(32),
  memberSince DATE,
  membershipNumber VARCHAR(32) NOT NULL,
  applicantId INTEGER,
  PRIMARY KEY (membershipNumber),
  FOREIGN KEY (applicantId) REFERENCES Applicant (applicantId)
);
