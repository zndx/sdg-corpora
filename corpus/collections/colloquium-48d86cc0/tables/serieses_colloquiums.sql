CREATE TABLE serieses_colloquiums (
  series_id INTEGER NOT NULL,
  colloquium_id INTEGER NOT NULL,
  PRIMARY KEY (series_id, colloquium_id),
  FOREIGN KEY (series_id) REFERENCES serieses (series_id),
  FOREIGN KEY (colloquium_id) REFERENCES colloquiums (id)
);
