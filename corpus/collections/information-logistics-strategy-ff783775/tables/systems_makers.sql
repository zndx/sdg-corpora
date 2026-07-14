CREATE TABLE systems_makers (
  analytical_information_system_id INTEGER NOT NULL,
  decision_maker_id INTEGER NOT NULL,
  PRIMARY KEY (analytical_information_system_id, decision_maker_id),
  FOREIGN KEY (analytical_information_system_id) REFERENCES analytical_information_systems (id),
  FOREIGN KEY (decision_maker_id) REFERENCES decision_makers (decision_maker_id)
);
