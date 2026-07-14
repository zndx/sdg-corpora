CREATE TABLE GovernmentalEntityPayment (
  entityId INTEGER NOT NULL,
  paymentId INTEGER NOT NULL,
  PRIMARY KEY (entityId, paymentId),
  FOREIGN KEY (entityId) REFERENCES GovernmentalEntity (entityId),
  FOREIGN KEY (paymentId) REFERENCES Payment (id)
);
