CREATE TABLE ancient_inscriptions (
  ancient_inscription_id INTEGER NOT NULL,
  inscription_i_d VARCHAR(32),
  script_type VARCHAR(32),
  discovery_location VARCHAR(32),
  date_discovered DATE,
  deciphered_text VARCHAR(32),
  linguistic_interpretation VARCHAR(32),
  settlement_area_id INTEGER,
  gaulish_tribe_id INTEGER,
  writing_system_id INTEGER,
  PRIMARY KEY (ancient_inscription_id),
  FOREIGN KEY (settlement_area_id) REFERENCES settlement_areas (settlement_area_id),
  FOREIGN KEY (gaulish_tribe_id) REFERENCES gaulish_tribes (gaulish_tribe_id),
  FOREIGN KEY (writing_system_id) REFERENCES writing_systems (id)
);
