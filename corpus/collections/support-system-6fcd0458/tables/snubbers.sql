CREATE TABLE snubbers (
  snubber_id VARCHAR(44) NOT NULL,
  location VARCHAR(32),
  is_operable BOOLEAN,
  is_functional BOOLEAN,
  regulatory_address VARCHAR(32),
  support_system_id INTEGER,
  maintenance_action_id INTEGER,
  PRIMARY KEY (snubber_id),
  FOREIGN KEY (support_system_id) REFERENCES support_systems (support_system_id),
  FOREIGN KEY (maintenance_action_id) REFERENCES maintenance_actions (id)
);
