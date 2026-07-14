CREATE TABLE steam_turbines (
  id INTEGER NOT NULL,
  turbine_identifier VARCHAR(32),
  power_output DECIMAL,
  steam_input_rate DECIMAL,
  operational_season VARCHAR(32),
  heat_sink_id INTEGER,
  pulp_mill_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (heat_sink_id) REFERENCES heat_sinks (heat_sink_id),
  FOREIGN KEY (pulp_mill_id) REFERENCES pulp_mills (id)
);
