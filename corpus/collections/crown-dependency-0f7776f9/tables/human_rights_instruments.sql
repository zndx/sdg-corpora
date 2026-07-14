CREATE TABLE human_rights_instruments (
  human_rights_instrument_id INTEGER NOT NULL,
  identifier VARCHAR(32),
  name VARCHAR(32),
  type VARCHAR(32),
  status VARCHAR(32),
  crown_dependency_id INTEGER,
  overseas_territory_id INTEGER,
  PRIMARY KEY (human_rights_instrument_id),
  FOREIGN KEY (crown_dependency_id) REFERENCES crown_dependencies (id),
  FOREIGN KEY (overseas_territory_id) REFERENCES overseas_territories (id)
);
