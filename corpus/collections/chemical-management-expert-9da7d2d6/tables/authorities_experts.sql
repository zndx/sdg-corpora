CREATE TABLE authorities_experts (
  environmental_authority_id INTEGER NOT NULL,
  chemical_management_expert_id INTEGER NOT NULL,
  PRIMARY KEY (environmental_authority_id, chemical_management_expert_id),
  FOREIGN KEY (environmental_authority_id) REFERENCES environmental_authorities (environmental_authority_id),
  FOREIGN KEY (chemical_management_expert_id) REFERENCES chemical_management_experts (id)
);
