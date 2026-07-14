CREATE TABLE Aircraft (
  id INTEGER NOT NULL,
  registrationNumber VARCHAR(32),
  aircraftType VARCHAR(32),
  operator VARCHAR(32),
  flightNumber VARCHAR(32),
  departureAirport VARCHAR(32),
  arrivalAirport VARCHAR(32),
  passengerCount INTEGER,
  cargoWeight DECIMAL,
  currentAltitude INTEGER,
  currentSpeed INTEGER,
  createdAt TIMESTAMP,
  updatedAt TIMESTAMP,
  PRIMARY KEY (id)
);
