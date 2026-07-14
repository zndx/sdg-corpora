CREATE TABLE collections_resources (
  digital_collection_id INTEGER NOT NULL,
  resource_id INTEGER NOT NULL,
  PRIMARY KEY (digital_collection_id, resource_id),
  FOREIGN KEY (digital_collection_id) REFERENCES digital_collections (digital_collection_id),
  FOREIGN KEY (resource_id) REFERENCES digital_resources (resource_id)
);
