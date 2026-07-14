CREATE TABLE CustomBackAssemblyAirCompartment (
  assemblyId VARCHAR(44) NOT NULL,
  compartmentId VARCHAR(44) NOT NULL,
  PRIMARY KEY (assemblyId, compartmentId),
  FOREIGN KEY (assemblyId) REFERENCES CustomBackAssembly (assemblyId),
  FOREIGN KEY (compartmentId) REFERENCES AirCompartment (compartmentId)
);
