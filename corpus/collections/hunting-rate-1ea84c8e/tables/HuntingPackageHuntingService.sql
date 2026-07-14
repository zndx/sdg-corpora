CREATE TABLE HuntingPackageHuntingService (
  packageId INTEGER NOT NULL,
  serviceId INTEGER NOT NULL,
  PRIMARY KEY (packageId, serviceId),
  FOREIGN KEY (packageId) REFERENCES HuntingPackage (packageId),
  FOREIGN KEY (serviceId) REFERENCES HuntingService (serviceId)
);
