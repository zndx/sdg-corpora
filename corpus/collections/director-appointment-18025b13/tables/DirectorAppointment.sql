CREATE TABLE DirectorAppointment (
  appointmentId INTEGER NOT NULL,
  appointmentDate DATE,
  divisionName VARCHAR(32),
  status VARCHAR(32),
  terminationDate DATE,
  advisorId INTEGER,
  divisionId INTEGER,
  PRIMARY KEY (appointmentId),
  FOREIGN KEY (advisorId) REFERENCES ProfessionalAdvisor (id),
  FOREIGN KEY (divisionId) REFERENCES CorporateDivision (id)
);
