CREATE TABLE trainings_commissions (
  capacity_building_training_id INTEGER NOT NULL,
  national_commission_id INTEGER NOT NULL,
  PRIMARY KEY (capacity_building_training_id, national_commission_id),
  FOREIGN KEY (capacity_building_training_id) REFERENCES capacity_building_trainings (capacity_building_training_id),
  FOREIGN KEY (national_commission_id) REFERENCES national_commissions (id)
);
