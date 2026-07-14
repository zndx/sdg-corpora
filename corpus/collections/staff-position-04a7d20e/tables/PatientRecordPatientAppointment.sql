CREATE TABLE PatientRecordPatientAppointment (
  recordId INTEGER NOT NULL,
  appointmentId INTEGER NOT NULL,
  PRIMARY KEY (recordId, appointmentId),
  FOREIGN KEY (recordId) REFERENCES PatientRecord (recordId),
  FOREIGN KEY (appointmentId) REFERENCES PatientAppointment (id)
);
