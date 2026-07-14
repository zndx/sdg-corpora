CREATE TABLE Beneficiary (
  id INTEGER NOT NULL,
  beneficiaryIdentifier VARCHAR(32),
  primaryLanguage VARCHAR(32),
  immigrationStatus VARCHAR(32),
  needsAssistance BOOLEAN,
  requiresInterpreter BOOLEAN,
  hotlineId INTEGER,
  incidentId INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (hotlineId) REFERENCES Hotline (id),
  FOREIGN KEY (incidentId) REFERENCES Incident (id)
);
