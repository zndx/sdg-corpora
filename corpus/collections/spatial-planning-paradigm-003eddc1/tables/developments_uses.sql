CREATE TABLE developments_uses (
  transit_oriented_development_id INTEGER NOT NULL,
  land_use_id INTEGER NOT NULL,
  PRIMARY KEY (transit_oriented_development_id, land_use_id),
  FOREIGN KEY (transit_oriented_development_id) REFERENCES transit_oriented_developments (id),
  FOREIGN KEY (land_use_id) REFERENCES land_uses (id)
);
