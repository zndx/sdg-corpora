CREATE TABLE PowerGrid (
  gridId VARCHAR(44) NOT NULL,
  gridOperator VARCHAR(32),
  voltageLevel VARCHAR(32),
  capacityMVA DECIMAL,
  lastMaintenanceDate TIMESTAMP,
  PRIMARY KEY (gridId)
);
