CREATE TABLE pulp_mills (
  id INTEGER NOT NULL,
  mill_identifier VARCHAR(32),
  location VARCHAR(32),
  country VARCHAR(32),
  operational_status VARCHAR(32),
  primary_product VARCHAR(32),
  heat_recovery_system_id INTEGER,
  steam_turbine_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (heat_recovery_system_id) REFERENCES heat_recovery_systems (id),
  FOREIGN KEY (steam_turbine_id) REFERENCES steam_turbines (id)
);
