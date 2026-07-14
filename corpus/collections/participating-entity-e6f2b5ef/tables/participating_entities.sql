CREATE TABLE participating_entities (
  participating_entity_id INTEGER NOT NULL,
  entity_identifier VARCHAR(32),
  entity_type VARCHAR(32),
  entity_name VARCHAR(32),
  contact_person VARCHAR(32),
  contact_address VARCHAR(32),
  contact_phone VARCHAR(32),
  enrolment_status VARCHAR(32),
  festival_participation_id INTEGER,
  festival_booth_id INTEGER,
  PRIMARY KEY (participating_entity_id),
  FOREIGN KEY (festival_participation_id) REFERENCES festival_participations (id),
  FOREIGN KEY (festival_booth_id) REFERENCES festival_booths (id)
);
