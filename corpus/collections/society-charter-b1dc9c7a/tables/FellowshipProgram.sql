CREATE TABLE FellowshipProgram (
  id INTEGER NOT NULL,
  programName VARCHAR(32),
  durationYears INTEGER,
  isPediatricOtolaryngology BOOLEAN,
  completionDate DATE,
  professionalId INTEGER,
  charterId INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (professionalId) REFERENCES MedicalProfessional (id),
  FOREIGN KEY (charterId) REFERENCES SocietyCharter (id)
);
