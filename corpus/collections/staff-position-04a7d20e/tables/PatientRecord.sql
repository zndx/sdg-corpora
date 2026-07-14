CREATE TABLE PatientRecord (
  recordId INTEGER NOT NULL,
  dateOfBirth DATE,
  insuranceProvider VARCHAR(32),
  policyNumber VARCHAR(32),
  lastUpdated TIMESTAMP,
  hipaaCompliant BOOLEAN,
  transactionId INTEGER,
  PRIMARY KEY (recordId),
  FOREIGN KEY (transactionId) REFERENCES PaymentTransaction (id)
);
