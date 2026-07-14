CREATE TABLE CustomBackAssemblyAirCellPlacement (
  assemblyId VARCHAR(44) NOT NULL,
  placementId INTEGER NOT NULL,
  PRIMARY KEY (assemblyId, placementId),
  FOREIGN KEY (assemblyId) REFERENCES CustomBackAssembly (assemblyId),
  FOREIGN KEY (placementId) REFERENCES AirCellPlacement (id)
);
