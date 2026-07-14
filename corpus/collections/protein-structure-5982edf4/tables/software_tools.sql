CREATE TABLE software_tools (
  id INTEGER NOT NULL,
  tool_id VARCHAR(32),
  tool_name VARCHAR(32),
  version VARCHAR(32),
  license_type VARCHAR(32),
  primary_function VARCHAR(32),
  developer VARCHAR(32),
  molecular_dynamics_simulation_id INTEGER,
  protein_structure_id INTEGER,
  small_molecule_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (molecular_dynamics_simulation_id) REFERENCES molecular_dynamics_simulations (molecular_dynamics_simulation_id),
  FOREIGN KEY (protein_structure_id) REFERENCES protein_structures (id),
  FOREIGN KEY (small_molecule_id) REFERENCES small_molecules (id)
);
