CREATE TABLE licenses (
  license_id VARCHAR(35) NOT NULL,
  business_name VARCHAR(32),
  license_class VARCHAR(32),
  issue_date TIMESTAMP,
  expiry_date DATE,
  status VARCHAR(32),
  municipal_board_id INTEGER,
  motion_id VARCHAR(35),
  business_entity_business_id VARCHAR(40),
  PRIMARY KEY (license_id),
  FOREIGN KEY (municipal_board_id) REFERENCES municipal_boards (id),
  FOREIGN KEY (motion_id) REFERENCES motions (motion_id),
  FOREIGN KEY (business_entity_business_id) REFERENCES business_entities (business_id)
);
