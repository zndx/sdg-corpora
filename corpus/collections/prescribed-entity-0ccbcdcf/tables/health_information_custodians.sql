CREATE TABLE health_information_custodians (
  health_information_custodian_id INTEGER NOT NULL,
  custodian_id VARCHAR(35),
  custodian_name VARCHAR(32),
  custodian_type VARCHAR(32),
  registration_date TIMESTAMP,
  compliance_status VARCHAR(32),
  prescribed_entity_id INTEGER,
  PRIMARY KEY (health_information_custodian_id),
  FOREIGN KEY (prescribed_entity_id) REFERENCES prescribed_entities (prescribed_entity_id)
);
