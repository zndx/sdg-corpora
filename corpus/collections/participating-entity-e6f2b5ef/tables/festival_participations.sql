CREATE TABLE festival_participations (
  id INTEGER NOT NULL,
  participation_id INTEGER,
  festival_name VARCHAR(32),
  application_date TIMESTAMP,
  evaluation_result VARCHAR(32),
  quality_score DECIMAL,
  standard_compliance BOOLEAN,
  participating_entity_id INTEGER,
  festival_booth_id INTEGER,
  product_display_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (participating_entity_id) REFERENCES participating_entities (participating_entity_id),
  FOREIGN KEY (festival_booth_id) REFERENCES festival_booths (id),
  FOREIGN KEY (product_display_id) REFERENCES product_displays (product_display_id)
);
