CREATE TABLE carers (
  id INTEGER NOT NULL,
  carer_id INTEGER,
  name VARCHAR(32),
  relationship_to_user VARCHAR(32),
  care_level VARCHAR(32),
  contact_number VARCHAR(32),
  service_user_id INTEGER,
  service_transition_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (service_user_id) REFERENCES service_users (id),
  FOREIGN KEY (service_transition_id) REFERENCES service_transitions (id)
);
