CREATE TABLE workstation_enclosures (
  id INTEGER NOT NULL,
  enclosure_type VARCHAR(32),
  available_expansion_slots INTEGER,
  power_supply_watts INTEGER,
  supported_form_factors VARCHAR(32),
  PRIMARY KEY (id)
);
