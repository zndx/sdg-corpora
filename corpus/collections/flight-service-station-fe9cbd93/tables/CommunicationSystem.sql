CREATE TABLE CommunicationSystem (
  id INTEGER NOT NULL,
  systemId INTEGER,
  systemName VARCHAR(32),
  frequencyBand VARCHAR(32),
  coverageRange DECIMAL,
  signalQuality VARCHAR(32),
  dataFormat VARCHAR(32),
  encryptionStatus BOOLEAN,
  lastMaintenanceDate DATE,
  PRIMARY KEY (id)
);
