CREATE TABLE equipments_activities (
  pool_equipment_id INTEGER NOT NULL,
  maintenance_activity_id INTEGER NOT NULL,
  PRIMARY KEY (pool_equipment_id, maintenance_activity_id),
  FOREIGN KEY (pool_equipment_id) REFERENCES pool_equipments (pool_equipment_id),
  FOREIGN KEY (maintenance_activity_id) REFERENCES maintenance_activities (maintenance_activity_id)
);
