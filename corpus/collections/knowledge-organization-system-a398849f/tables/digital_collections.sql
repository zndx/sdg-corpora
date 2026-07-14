CREATE TABLE digital_collections (
  digital_collection_id INTEGER NOT NULL,
  collection_id VARCHAR(40),
  name VARCHAR(32),
  description VARCHAR(32),
  date_established DATE,
  resource_count INTEGER,
  access_level VARCHAR(32),
  knowledge_organization_system_id INTEGER,
  user_id INTEGER,
  PRIMARY KEY (digital_collection_id),
  FOREIGN KEY (knowledge_organization_system_id) REFERENCES knowledge_organization_systems (knowledge_organization_system_id),
  FOREIGN KEY (user_id) REFERENCES users (id)
);
