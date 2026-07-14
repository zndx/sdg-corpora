CREATE TABLE makers_systems (
  decision_maker_id INTEGER NOT NULL,
  analytical_information_system_id INTEGER NOT NULL,
  PRIMARY KEY (decision_maker_id, analytical_information_system_id),
  FOREIGN KEY (decision_maker_id) REFERENCES decision_makers (decision_maker_id),
  FOREIGN KEY (analytical_information_system_id) REFERENCES analytical_information_systems (id)
);
