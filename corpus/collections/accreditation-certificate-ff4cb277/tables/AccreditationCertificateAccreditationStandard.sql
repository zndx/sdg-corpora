CREATE TABLE AccreditationCertificateAccreditationStandard (
  certificateId INTEGER NOT NULL,
  standardId INTEGER NOT NULL,
  PRIMARY KEY (certificateId, standardId),
  FOREIGN KEY (certificateId) REFERENCES AccreditationCertificate (id),
  FOREIGN KEY (standardId) REFERENCES AccreditationStandard (standardId)
);
