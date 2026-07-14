CREATE TABLE DimensionalProfile (
  profileId INTEGER NOT NULL,
  insideDiameterMin DECIMAL,
  insideDiameterMax DECIMAL,
  wallThicknessMin DECIMAL,
  rectangularBusBarWidth DECIMAL,
  rectangularBusBarHeight DECIMAL,
  roundBusBarDiameter DECIMAL,
  shrinkRatio VARCHAR(32),
  barId INTEGER,
  tubingId INTEGER,
  PRIMARY KEY (profileId),
  FOREIGN KEY (barId) REFERENCES BusBar (id),
  FOREIGN KEY (tubingId) REFERENCES InsulationTubing (tubingId)
);
