CREATE TABLE infrastructures_engineers (
  network_infrastructure_network_id VARCHAR(44) NOT NULL,
  technical_support_engineer_id INTEGER NOT NULL,
  PRIMARY KEY (network_infrastructure_network_id, technical_support_engineer_id),
  FOREIGN KEY (network_infrastructure_network_id) REFERENCES network_infrastructures (network_id),
  FOREIGN KEY (technical_support_engineer_id) REFERENCES technical_support_engineers (technical_support_engineer_id)
);
