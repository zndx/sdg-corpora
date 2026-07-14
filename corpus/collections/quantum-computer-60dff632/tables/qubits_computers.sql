CREATE TABLE qubits_computers (
  qubit_id INTEGER NOT NULL,
  quantum_computer_id INTEGER NOT NULL,
  PRIMARY KEY (qubit_id, quantum_computer_id),
  FOREIGN KEY (qubit_id) REFERENCES qubits (id),
  FOREIGN KEY (quantum_computer_id) REFERENCES quantum_computers (id)
);
