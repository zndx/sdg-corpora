CREATE TABLE qubits (
  id INTEGER NOT NULL,
  state_vector VARCHAR(32),
  superposition_enabled BOOLEAN,
  entangled_with VARCHAR(32),
  PRIMARY KEY (id)
);
