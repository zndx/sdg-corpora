CREATE TABLE international_networks (
  id INTEGER NOT NULL,
  network_code VARCHAR(40),
  network_name VARCHAR(32),
  founding_date DATE,
  member_count INTEGER,
  scope VARCHAR(32),
  is_active BOOLEAN,
  chemical_management_expert_id INTEGER,
  environmental_authority_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (chemical_management_expert_id) REFERENCES chemical_management_experts (id),
  FOREIGN KEY (environmental_authority_id) REFERENCES environmental_authorities (environmental_authority_id)
);
