CREATE TABLE HuntingService (
  serviceId INTEGER NOT NULL,
  serviceName VARCHAR(32),
  serviceType VARCHAR(32),
  unitPrice VARCHAR(32),
  unitType VARCHAR(32),
  quantity INTEGER,
  packageId INTEGER,
  licenseId INTEGER,
  PRIMARY KEY (serviceId),
  FOREIGN KEY (packageId) REFERENCES HuntingPackage (packageId),
  FOREIGN KEY (licenseId) REFERENCES HuntingLicense (id)
);
