CREATE TABLE parcels (
  id INTEGER NOT NULL,
  parcel_id INTEGER,
  address VARCHAR(32),
  zoning_district VARCHAR(32),
  land_use VARCHAR(32),
  owner_name VARCHAR(32),
  is_publicly_accessible BOOLEAN,
  business_entity_business_id VARCHAR(40),
  project_id INTEGER,
  municipal_board_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (business_entity_business_id) REFERENCES business_entities (business_id),
  FOREIGN KEY (project_id) REFERENCES projects (project_id),
  FOREIGN KEY (municipal_board_id) REFERENCES municipal_boards (id)
);
