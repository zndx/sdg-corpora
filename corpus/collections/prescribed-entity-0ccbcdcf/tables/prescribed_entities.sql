CREATE TABLE prescribed_entities (
  prescribed_entity_id INTEGER NOT NULL,
  entity_identifier VARCHAR(32),
  entity_name VARCHAR(32),
  prescription_date TIMESTAMP,
  approval_status VARCHAR(32),
  review_cycle INTEGER,
  privacy_review_id INTEGER,
  health_information_custodian_id INTEGER,
  health_registry_id INTEGER,
  PRIMARY KEY (prescribed_entity_id),
  FOREIGN KEY (privacy_review_id) REFERENCES privacy_reviews (id),
  FOREIGN KEY (health_information_custodian_id) REFERENCES health_information_custodians (health_information_custodian_id),
  FOREIGN KEY (health_registry_id) REFERENCES health_registries (health_registry_id)
);
