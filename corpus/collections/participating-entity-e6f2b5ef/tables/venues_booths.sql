CREATE TABLE venues_booths (
  festival_venue_id INTEGER NOT NULL,
  festival_booth_id INTEGER NOT NULL,
  PRIMARY KEY (festival_venue_id, festival_booth_id),
  FOREIGN KEY (festival_venue_id) REFERENCES festival_venues (id),
  FOREIGN KEY (festival_booth_id) REFERENCES festival_booths (id)
);
