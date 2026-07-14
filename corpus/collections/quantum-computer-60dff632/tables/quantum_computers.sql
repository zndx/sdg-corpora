CREATE TABLE quantum_computers (
  id INTEGER NOT NULL,
  qubit_count INTEGER,
  error_rate DECIMAL,
  fault_tolerance BOOLEAN,
  manufacturer VARCHAR(46),
  model_name VARCHAR(32),
  operational_status VARCHAR(32),
  qubit_id INTEGER,
  cryptosystem_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (qubit_id) REFERENCES qubits (id),
  FOREIGN KEY (cryptosystem_id) REFERENCES cryptosystems (cryptosystem_id)
);
