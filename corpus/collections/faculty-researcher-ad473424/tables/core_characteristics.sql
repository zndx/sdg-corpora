CREATE TABLE core_characteristics (
  core_characteristic_id INTEGER NOT NULL,
  trait_id VARCHAR(44),
  trait_name VARCHAR(32),
  description VARCHAR(32),
  impact_level VARCHAR(32),
  faculty_researcher_id INTEGER,
  PRIMARY KEY (core_characteristic_id),
  FOREIGN KEY (faculty_researcher_id) REFERENCES faculty_researchers (id)
);
