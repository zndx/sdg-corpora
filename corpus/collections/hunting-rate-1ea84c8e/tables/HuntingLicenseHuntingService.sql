CREATE TABLE HuntingLicenseHuntingService (
  licenseId INTEGER NOT NULL,
  serviceId INTEGER NOT NULL,
  PRIMARY KEY (licenseId, serviceId),
  FOREIGN KEY (licenseId) REFERENCES HuntingLicense (id),
  FOREIGN KEY (serviceId) REFERENCES HuntingService (serviceId)
);
