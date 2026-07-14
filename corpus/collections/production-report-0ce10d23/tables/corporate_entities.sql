CREATE TABLE corporate_entities (
  id INTEGER NOT NULL,
  entity_id VARCHAR(44),
  entity_name VARCHAR(32),
  headquarters_location VARCHAR(32),
  entity_type VARCHAR(32),
  market_cap DECIMAL,
  PRIMARY KEY (id)
);
