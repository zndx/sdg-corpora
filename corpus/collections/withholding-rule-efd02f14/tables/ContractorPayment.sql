CREATE TABLE ContractorPayment (
  contractorId INTEGER NOT NULL,
  paymentId INTEGER NOT NULL,
  PRIMARY KEY (contractorId, paymentId),
  FOREIGN KEY (contractorId) REFERENCES Contractor (contractorId),
  FOREIGN KEY (paymentId) REFERENCES Payment (id)
);
