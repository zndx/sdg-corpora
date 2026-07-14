CREATE TABLE divine_physicians (
  physician_id VARCHAR(32) NOT NULL,
  title VARCHAR(32),
  heals_spiritual_sickness BOOLEAN,
  calls_all_men BOOLEAN,
  conversion_moment_id INTEGER,
  biblical_character_id INTEGER,
  PRIMARY KEY (physician_id),
  FOREIGN KEY (conversion_moment_id) REFERENCES conversion_moments (id),
  FOREIGN KEY (biblical_character_id) REFERENCES biblical_characters (biblical_character_id)
);
