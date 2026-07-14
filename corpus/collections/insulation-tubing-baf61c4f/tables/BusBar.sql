CREATE TABLE BusBar (
  id INTEGER NOT NULL,
  barType VARCHAR(32),
  crossSectionWidth DECIMAL,
  crossSectionHeight DECIMAL,
  nominalDiameter DECIMAL,
  voltageRating DECIMAL,
  material VARCHAR(32),
  tubingId INTEGER,
  assemblyId INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (tubingId) REFERENCES InsulationTubing (tubingId),
  FOREIGN KEY (assemblyId) REFERENCES SwitchgearAssembly (assemblyId)
);
