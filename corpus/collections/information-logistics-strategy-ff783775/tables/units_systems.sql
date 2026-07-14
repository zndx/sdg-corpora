CREATE TABLE units_systems (
  organizational_unit_id INTEGER NOT NULL,
  analytical_information_system_id INTEGER NOT NULL,
  PRIMARY KEY (organizational_unit_id, analytical_information_system_id),
  FOREIGN KEY (organizational_unit_id) REFERENCES organizational_units (organizational_unit_id),
  FOREIGN KEY (analytical_information_system_id) REFERENCES analytical_information_systems (id)
);
