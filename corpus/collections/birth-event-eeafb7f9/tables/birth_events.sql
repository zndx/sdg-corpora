CREATE TABLE birth_events (
  birth_event_id INTEGER NOT NULL,
  identifier VARCHAR(32),
  birth_date DATE,
  location_name VARCHAR(32),
  parent_female_name VARCHAR(32),
  parent_male_name VARCHAR(32),
  infant_name VARCHAR(32),
  location_id INTEGER,
  human_id INTEGER,
  involves_mother_human_id INTEGER,
  involves_father_human_id INTEGER,
  PRIMARY KEY (birth_event_id),
  FOREIGN KEY (location_id) REFERENCES locations (id),
  FOREIGN KEY (human_id) REFERENCES humans (id),
  FOREIGN KEY (involves_mother_human_id) REFERENCES humans (id),
  FOREIGN KEY (involves_father_human_id) REFERENCES humans (id)
);
