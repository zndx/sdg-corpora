CREATE TABLE SocietyMeeting (
  id INTEGER NOT NULL,
  meetingDate TIMESTAMP,
  meetingType VARCHAR(32),
  location VARCHAR(32),
  isEligibilityRequirement BOOLEAN,
  charterId INTEGER,
  professionalId INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (charterId) REFERENCES SocietyCharter (id),
  FOREIGN KEY (professionalId) REFERENCES MedicalProfessional (id)
);
