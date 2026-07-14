CREATE TABLE eternal_inheritances (
  eternal_inheritance_id INTEGER NOT NULL,
  inheritance_id VARCHAR(44),
  inheritance_type VARCHAR(32),
  distribution_date TIMESTAMP,
  value_description VARCHAR(32),
  adoption_seal_id INTEGER,
  PRIMARY KEY (eternal_inheritance_id),
  FOREIGN KEY (adoption_seal_id) REFERENCES adoption_seals (adoption_seal_id)
);
