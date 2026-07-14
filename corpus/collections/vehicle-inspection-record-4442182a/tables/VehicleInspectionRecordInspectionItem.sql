CREATE TABLE VehicleInspectionRecordInspectionItem (
  recordId INTEGER NOT NULL,
  itemId INTEGER NOT NULL,
  PRIMARY KEY (recordId, itemId),
  FOREIGN KEY (recordId) REFERENCES VehicleInspectionRecord (id),
  FOREIGN KEY (itemId) REFERENCES InspectionItem (itemId)
);
