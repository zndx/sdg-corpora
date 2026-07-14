CREATE TABLE VehicleInspectionItem (
  vehicleId INTEGER NOT NULL,
  itemId INTEGER NOT NULL,
  PRIMARY KEY (vehicleId, itemId),
  FOREIGN KEY (vehicleId) REFERENCES Vehicle (id),
  FOREIGN KEY (itemId) REFERENCES InspectionItem (itemId)
);
