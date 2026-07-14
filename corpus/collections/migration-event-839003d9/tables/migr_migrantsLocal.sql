CREATE TABLE migr_migrantsLocal (
  migrant_id INTEGER NOT NULL,
  local_id INTEGER NOT NULL,
  PRIMARY KEY (migrant_id, local_id),
  FOREIGN KEY (migrant_id) REFERENCES migr_migrants (migrant_id),
  FOREIGN KEY (local_id) REFERENCES migr_locals (id)
);
