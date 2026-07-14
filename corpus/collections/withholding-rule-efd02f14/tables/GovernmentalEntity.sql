CREATE TABLE GovernmentalEntity (
  entityId INTEGER NOT NULL,
  entityIdentifier VARCHAR(32),
  entityName VARCHAR(32),
  jurisdictionLevel VARCHAR(32),
  annualPaymentVolume DECIMAL,
  isInstrumentality BOOLEAN,
  PRIMARY KEY (entityId)
);
