CREATE TABLE VehicleVehicleInspectionRecord (
  vehicleId INTEGER NOT NULL,
  recordId INTEGER NOT NULL,
  PRIMARY KEY (vehicleId, recordId),
  FOREIGN KEY (vehicleId) REFERENCES Vehicle (id),
  FOREIGN KEY (recordId) REFERENCES VehicleInspectionRecord (id)
);
