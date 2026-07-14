CREATE TABLE migr_localsMigrant (
  local_id INTEGER NOT NULL,
  migrant_id INTEGER NOT NULL,
  PRIMARY KEY (local_id, migrant_id),
  FOREIGN KEY (local_id) REFERENCES migr_locals (id),
  FOREIGN KEY (migrant_id) REFERENCES migr_migrants (migrant_id)
);
