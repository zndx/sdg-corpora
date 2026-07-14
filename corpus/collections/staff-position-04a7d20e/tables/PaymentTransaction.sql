CREATE TABLE PaymentTransaction (
  id INTEGER NOT NULL,
  transactionId INTEGER,
  amount DECIMAL,
  transactionDate TIMESTAMP,
  paymentMethod VARCHAR(32),
  status VARCHAR(32),
  processedBy VARCHAR(32),
  recordId INTEGER,
  appointmentId INTEGER,
  createdAt TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (recordId) REFERENCES PatientRecord (recordId),
  FOREIGN KEY (appointmentId) REFERENCES PatientAppointment (id)
);
