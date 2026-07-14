CREATE TABLE PatientAppointment (
  id INTEGER NOT NULL,
  appointmentId VARCHAR(35),
  scheduledDateTime TIMESTAMP,
  status VARCHAR(32),
  providerId VARCHAR(35),
  patientId VARCHAR(32),
  serviceType VARCHAR(32),
  reminderSent BOOLEAN,
  memberId INTEGER,
  recordId INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (memberId) REFERENCES StaffMember (id),
  FOREIGN KEY (recordId) REFERENCES PatientRecord (recordId)
);
