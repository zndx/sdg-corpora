CREATE TABLE infant_care_items (
  infant_care_item_id INTEGER NOT NULL,
  has_item_name VARCHAR(32),
  has_material_type VARCHAR(32),
  has_physical_condition VARCHAR(32),
  birth_event_id INTEGER,
  building_id INTEGER,
  created_at TIMESTAMP,
  PRIMARY KEY (infant_care_item_id),
  FOREIGN KEY (birth_event_id) REFERENCES birth_events (birth_event_id),
  FOREIGN KEY (building_id) REFERENCES buildings (id)
);
