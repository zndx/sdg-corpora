CREATE TABLE Incident (
  id INTEGER NOT NULL,
  incidentIdentifier VARCHAR(32),
  incidentType VARCHAR(32),
  reportedDateTime TIMESTAMP,
  isConfirmed BOOLEAN,
  severityLevel VARCHAR(32),
  hotlineId INTEGER,
  organizationId INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (hotlineId) REFERENCES Hotline (id),
  FOREIGN KEY (organizationId) REFERENCES ServiceOrganization (id)
);
