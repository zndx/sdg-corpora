CREATE TABLE CorporateDivisionProfessionalAdvisor (
  divisionId INTEGER NOT NULL,
  advisorId INTEGER NOT NULL,
  PRIMARY KEY (divisionId, advisorId),
  FOREIGN KEY (divisionId) REFERENCES CorporateDivision (id),
  FOREIGN KEY (advisorId) REFERENCES ProfessionalAdvisor (id)
);
