CREATE TABLE InsulationTubing (
  tubingId INTEGER NOT NULL,
  productCode VARCHAR(32),
  shrinkRatio VARCHAR(32),
  operatingTemperatureMin DECIMAL,
  operatingTemperatureMax DECIMAL,
  minimumShrinkTemperature DECIMAL,
  halogenFree BOOLEAN,
  rohsCompliant BOOLEAN,
  continuousLength BOOLEAN,
  specificationId INTEGER,
  barId INTEGER,
  PRIMARY KEY (tubingId),
  FOREIGN KEY (specificationId) REFERENCES MaterialSpecification (id),
  FOREIGN KEY (barId) REFERENCES BusBar (id)
);
