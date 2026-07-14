CREATE TABLE pedigrees (
  id INTEGER NOT NULL,
  pedigree_id VARCHAR(44),
  sire_name VARCHAR(32),
  dam_name VARCHAR(32),
  grand_sire_name VARCHAR(32),
  grand_dam_name VARCHAR(32),
  jumping_sire_count INTEGER,
  horse_id INTEGER,
  includes_sire_horse_id INTEGER,
  includes_dam_horse_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (horse_id) REFERENCES horses (id),
  FOREIGN KEY (includes_sire_horse_id) REFERENCES horses (id),
  FOREIGN KEY (includes_dam_horse_id) REFERENCES horses (id)
);
