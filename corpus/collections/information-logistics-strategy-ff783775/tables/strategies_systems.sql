CREATE TABLE strategies_systems (
  information_logistics_strategy_id INTEGER NOT NULL,
  analytical_information_system_id INTEGER NOT NULL,
  PRIMARY KEY (information_logistics_strategy_id, analytical_information_system_id),
  FOREIGN KEY (information_logistics_strategy_id) REFERENCES information_logistics_strategies (information_logistics_strategy_id),
  FOREIGN KEY (analytical_information_system_id) REFERENCES analytical_information_systems (id)
);
