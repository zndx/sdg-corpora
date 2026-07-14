CREATE TABLE consultants (
  id INTEGER NOT NULL,
  consultant_name VARCHAR(32),
  service_type VARCHAR(32),
  contact_phone VARCHAR(32),
  advisor_role VARCHAR(32),
  corporate_entity_id INTEGER,
  represents_corporate_entity_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (corporate_entity_id) REFERENCES corporate_entities (id),
  FOREIGN KEY (represents_corporate_entity_id) REFERENCES corporate_entities (id)
);
