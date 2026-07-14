CREATE TABLE biblical_characters (
  biblical_character_id INTEGER NOT NULL,
  character_id VARCHAR(44),
  name VARCHAR(32),
  role VARCHAR(32),
  is_disciple BOOLEAN,
  occupation VARCHAR(32),
  physician_id VARCHAR(32),
  reference_id VARCHAR(32),
  PRIMARY KEY (biblical_character_id),
  FOREIGN KEY (physician_id) REFERENCES divine_physicians (physician_id),
  FOREIGN KEY (reference_id) REFERENCES scriptural_references (reference_id)
);
