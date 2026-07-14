CREATE TABLE AirCompartment (
  compartmentId VARCHAR(44) NOT NULL,
  compartmentName VARCHAR(32),
  isAdjustable BOOLEAN,
  valveLocation VARCHAR(32),
  assemblyId VARCHAR(44),
  createdAt TIMESTAMP,
  updatedAt TIMESTAMP,
  PRIMARY KEY (compartmentId),
  FOREIGN KEY (assemblyId) REFERENCES CustomBackAssembly (assemblyId)
);
