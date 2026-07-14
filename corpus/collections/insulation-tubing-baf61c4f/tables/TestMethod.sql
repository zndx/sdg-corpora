CREATE TABLE TestMethod (
  methodId INTEGER NOT NULL,
  methodCode VARCHAR(32),
  testType VARCHAR(32),
  standardBody VARCHAR(32),
  agingCondition VARCHAR(32),
  specificationId INTEGER,
  tubingId INTEGER,
  PRIMARY KEY (methodId),
  FOREIGN KEY (specificationId) REFERENCES MaterialSpecification (id),
  FOREIGN KEY (tubingId) REFERENCES InsulationTubing (tubingId)
);
