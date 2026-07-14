CREATE TABLE institutional_reforms (
  id INTEGER NOT NULL,
  reform_id VARCHAR(44),
  initiation_date TIMESTAMP,
  ratification_date DATE,
  legal_basis VARCHAR(32),
  status VARCHAR(32),
  mandate_scope VARCHAR(32),
  quality_assurance_system_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (quality_assurance_system_id) REFERENCES quality_assurance_systems (quality_assurance_system_id)
);
