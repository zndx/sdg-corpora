CREATE TABLE ContractPayment (
  contractId INTEGER NOT NULL,
  paymentId INTEGER NOT NULL,
  PRIMARY KEY (contractId, paymentId),
  FOREIGN KEY (contractId) REFERENCES Contract (id),
  FOREIGN KEY (paymentId) REFERENCES Payment (id)
);
