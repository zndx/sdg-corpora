CREATE TABLE cryptosystems (
  cryptosystem_id INTEGER NOT NULL,
  algorithm_type VARCHAR(32),
  security_basis VARCHAR(32),
  key_length INTEGER,
  vulnerability_status VARCHAR(32),
  mathematical_problem_id INTEGER,
  cyber_security_protocol_id INTEGER,
  PRIMARY KEY (cryptosystem_id),
  FOREIGN KEY (mathematical_problem_id) REFERENCES mathematical_problems (mathematical_problem_id),
  FOREIGN KEY (cyber_security_protocol_id) REFERENCES cyber_security_protocols (cyber_security_protocol_id)
);
