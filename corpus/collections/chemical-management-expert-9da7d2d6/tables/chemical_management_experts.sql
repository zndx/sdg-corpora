CREATE TABLE chemical_management_experts (
  id INTEGER NOT NULL,
  expert_identifier VARCHAR(32),
  full_name VARCHAR(36),
  degree VARCHAR(32),
  specialization VARCHAR(32),
  start_date TIMESTAMP,
  current_status VARCHAR(32),
  environmental_authority_id INTEGER,
  international_network_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (environmental_authority_id) REFERENCES environmental_authorities (environmental_authority_id),
  FOREIGN KEY (international_network_id) REFERENCES international_networks (id)
);
