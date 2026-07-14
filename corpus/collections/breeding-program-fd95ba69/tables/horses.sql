CREATE TABLE horses (
  id INTEGER NOT NULL,
  horse_id VARCHAR(35),
  horse_name VARCHAR(32),
  registration_number VARCHAR(32),
  date_of_birth DATE,
  sex VARCHAR(32),
  breed VARCHAR(32),
  status VARCHAR(32),
  breeding_program_id INTEGER,
  owner_id INTEGER,
  has_sire_horse_id INTEGER,
  has_dam_horse_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (breeding_program_id) REFERENCES breeding_programs (id),
  FOREIGN KEY (owner_id) REFERENCES owners (owner_id),
  FOREIGN KEY (has_sire_horse_id) REFERENCES horses (id),
  FOREIGN KEY (has_dam_horse_id) REFERENCES horses (id)
);
