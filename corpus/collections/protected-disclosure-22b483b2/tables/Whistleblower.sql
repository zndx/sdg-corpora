CREATE TABLE Whistleblower (
  whistleblowerId INTEGER NOT NULL,
  role VARCHAR(32),
  campusAffiliation VARCHAR(32),
  isProtectedFromRetaliation BOOLEAN,
  contactEmail VARCHAR(32),
  contactPhone VARCHAR(32),
  disclosureId INTEGER,
  campusId INTEGER,
  PRIMARY KEY (whistleblowerId),
  FOREIGN KEY (disclosureId) REFERENCES ProtectedDisclosure (disclosureId),
  FOREIGN KEY (campusId) REFERENCES CollegeCampus (id)
);
