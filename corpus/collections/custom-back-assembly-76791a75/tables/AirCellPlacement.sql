CREATE TABLE AirCellPlacement (
  id INTEGER NOT NULL,
  cellId INTEGER,
  profileType VARCHAR(32),
  widthCm DECIMAL,
  heightCm DECIMAL,
  gridRow INTEGER,
  gridColumn INTEGER,
  assemblyId VARCHAR(44),
  PRIMARY KEY (id),
  FOREIGN KEY (assemblyId) REFERENCES CustomBackAssembly (assemblyId)
);
