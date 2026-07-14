CREATE TABLE birth_events (
  birth_event_id INTEGER NOT NULL,
  has_event_date DATE,
  has_birth_location VARCHAR(32),
  building_id INTEGER,
  human_person_id INTEGER,
  has_father_human_person_id INTEGER,
  has_child_human_person_id INTEGER,
  PRIMARY KEY (birth_event_id),
  FOREIGN KEY (building_id) REFERENCES buildings (id),
  FOREIGN KEY (human_person_id) REFERENCES human_persons (id),
  FOREIGN KEY (has_father_human_person_id) REFERENCES human_persons (id),
  FOREIGN KEY (has_child_human_person_id) REFERENCES human_persons (id)
);
