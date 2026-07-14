CREATE TABLE DigitalService (
  id INTEGER NOT NULL,
  serviceId VARCHAR(44),
  serviceName VARCHAR(32),
  baseUrl VARCHAR(68),
  serviceType VARCHAR(32),
  status VARCHAR(32),
  lastUpdated TIMESTAMP,
  applicationId INTEGER,
  storageId INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (applicationId) REFERENCES SoftwareApplication (id),
  FOREIGN KEY (storageId) REFERENCES CloudStorage (id)
);
