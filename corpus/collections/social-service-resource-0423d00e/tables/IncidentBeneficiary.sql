CREATE TABLE IncidentBeneficiary (
  incidentId INTEGER NOT NULL,
  beneficiaryId INTEGER NOT NULL,
  PRIMARY KEY (incidentId, beneficiaryId),
  FOREIGN KEY (incidentId) REFERENCES Incident (id),
  FOREIGN KEY (beneficiaryId) REFERENCES Beneficiary (id)
);
