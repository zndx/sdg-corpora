CREATE TABLE Vehicle (
  id INTEGER NOT NULL,
  makeModel VARCHAR(32),
  registrationNumber VARCHAR(32),
  ownerName VARCHAR(32),
  odometerReading INTEGER,
  inspectionStatus VARCHAR(32),
  PRIMARY KEY (id)
);
