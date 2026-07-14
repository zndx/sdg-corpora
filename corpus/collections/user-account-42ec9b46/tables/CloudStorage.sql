CREATE TABLE CloudStorage (
  id INTEGER NOT NULL,
  storageId VARCHAR(32),
  storageName VARCHAR(32),
  capacityTb DECIMAL,
  isPrivate BOOLEAN,
  autoSaveEnabled BOOLEAN,
  serviceId INTEGER,
  documentId INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (serviceId) REFERENCES DigitalService (id),
  FOREIGN KEY (documentId) REFERENCES UserDocument (documentId)
);
