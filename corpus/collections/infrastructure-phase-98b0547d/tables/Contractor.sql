CREATE TABLE Contractor (
  id INTEGER NOT NULL,
  contractorId VARCHAR(33),
  contractorName VARCHAR(32),
  licenseNumber VARCHAR(32),
  contactEmail VARCHAR(32),
  status VARCHAR(32),
  deficiencyId VARCHAR(32),
  developerId VARCHAR(32),
  createdAt TIMESTAMP,
  updatedAt TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (deficiencyId) REFERENCES Deficiency (deficiencyId),
  FOREIGN KEY (developerId) REFERENCES Developer (developerId)
);
