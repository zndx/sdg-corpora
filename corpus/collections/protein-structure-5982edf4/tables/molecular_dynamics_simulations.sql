CREATE TABLE molecular_dynamics_simulations (
  molecular_dynamics_simulation_id INTEGER NOT NULL,
  simulation_id VARCHAR(44),
  start_time TIMESTAMP,
  end_time TIMESTAMP,
  duration DECIMAL,
  temperature DECIMAL,
  pressure DECIMAL,
  force_field VARCHAR(32),
  convergence_status VARCHAR(32),
  software_tool_id INTEGER,
  protein_structure_id INTEGER,
  PRIMARY KEY (molecular_dynamics_simulation_id),
  FOREIGN KEY (software_tool_id) REFERENCES software_tools (id),
  FOREIGN KEY (protein_structure_id) REFERENCES protein_structures (id)
);
