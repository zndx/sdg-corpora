CREATE TABLE corporate_entities (
  corporate_entity_id INTEGER NOT NULL,
  entity_identifier VARCHAR(32),
  legal_name VARCHAR(32),
  jurisdiction VARCHAR(32),
  market_segment VARCHAR(32),
  entity_status VARCHAR(32),
  executive_person_id INTEGER,
  has_subsidiary_corporate_entity_id INTEGER,
  geographic_region_id INTEGER,
  PRIMARY KEY (corporate_entity_id),
  FOREIGN KEY (executive_person_id) REFERENCES executive_persons (id),
  FOREIGN KEY (has_subsidiary_corporate_entity_id) REFERENCES corporate_entities (corporate_entity_id),
  FOREIGN KEY (geographic_region_id) REFERENCES geographic_regions (geographic_region_id)
);
