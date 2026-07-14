CREATE TABLE QualifiedMechanicVehicleInspectionRecord (
  mechanicId INTEGER NOT NULL,
  recordId INTEGER NOT NULL,
  PRIMARY KEY (mechanicId, recordId),
  FOREIGN KEY (mechanicId) REFERENCES QualifiedMechanic (mechanicId),
  FOREIGN KEY (recordId) REFERENCES VehicleInspectionRecord (id)
);
