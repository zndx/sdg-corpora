CREATE TABLE Applicant (
  applicantId INTEGER NOT NULL,
  passportNumber VARCHAR(32),
  socialSecurityNumber VARCHAR(32),
  dateOfBirth DATE,
  placeOfBirth VARCHAR(32),
  nationality VARCHAR(32),
  currentResidence VARCHAR(32),
  residenceDuration DECIMAL,
  qualificationId INTEGER,
  membershipNumber VARCHAR(32),
  personId INTEGER,
  PRIMARY KEY (applicantId),
  FOREIGN KEY (qualificationId) REFERENCES Qualification (id),
  FOREIGN KEY (membershipNumber) REFERENCES ProfessionalMembership (membershipNumber),
  FOREIGN KEY (personId) REFERENCES RegulatedPerson (id)
);
