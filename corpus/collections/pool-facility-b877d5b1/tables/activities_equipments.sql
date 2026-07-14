CREATE TABLE activities_equipments (
  maintenance_activity_id INTEGER NOT NULL,
  pool_equipment_id INTEGER NOT NULL,
  PRIMARY KEY (maintenance_activity_id, pool_equipment_id),
  FOREIGN KEY (maintenance_activity_id) REFERENCES maintenance_activities (maintenance_activity_id),
  FOREIGN KEY (pool_equipment_id) REFERENCES pool_equipments (pool_equipment_id)
);
