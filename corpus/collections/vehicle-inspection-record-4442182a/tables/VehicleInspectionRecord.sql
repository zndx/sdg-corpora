CREATE TABLE VehicleInspectionRecord (
  id INTEGER NOT NULL,
  inspectionDate DATE,
  reviewDueDate DATE,
  odometerReading INTEGER,
  registrationNumber VARCHAR(32),
  mechanicName VARCHAR(32),
  mechanicSignature VARCHAR(32),
  businessName VARCHAR(32),
  businessAddress VARCHAR(32),
  vehicleId INTEGER,
  mechanicId INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (vehicleId) REFERENCES Vehicle (id),
  FOREIGN KEY (mechanicId) REFERENCES QualifiedMechanic (mechanicId)
);
