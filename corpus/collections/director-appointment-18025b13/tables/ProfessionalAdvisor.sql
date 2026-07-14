CREATE TABLE ProfessionalAdvisor (
  id INTEGER NOT NULL,
  advisorId VARCHAR(32),
  firstName VARCHAR(32),
  lastName VARCHAR(32),
  corporateTitle VARCHAR(32),
  specialization VARCHAR(32),
  educationProgramCompleted BOOLEAN,
  contactEmail VARCHAR(32),
  contactPhone VARCHAR(32),
  appointmentId INTEGER,
  divisionId INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (appointmentId) REFERENCES DirectorAppointment (appointmentId),
  FOREIGN KEY (divisionId) REFERENCES CorporateDivision (id)
);
