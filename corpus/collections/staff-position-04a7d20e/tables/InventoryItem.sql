CREATE TABLE InventoryItem (
  id INTEGER NOT NULL,
  itemId VARCHAR(32),
  itemName VARCHAR(32),
  category VARCHAR(32),
  quantityOnHand INTEGER,
  reorderLevel INTEGER,
  lastRestocked TIMESTAMP,
  memberId INTEGER,
  appointmentId INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (memberId) REFERENCES StaffMember (id),
  FOREIGN KEY (appointmentId) REFERENCES PatientAppointment (id)
);
