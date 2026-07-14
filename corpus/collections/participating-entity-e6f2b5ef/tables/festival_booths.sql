CREATE TABLE festival_booths (
  id INTEGER NOT NULL,
  booth_id INTEGER,
  booth_location VARCHAR(32),
  booth_size DECIMAL,
  booth_status VARCHAR(32),
  setup_date DATE,
  dismantle_date DATE,
  festival_venue_id INTEGER,
  festival_participation_id INTEGER,
  product_display_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (festival_venue_id) REFERENCES festival_venues (id),
  FOREIGN KEY (festival_participation_id) REFERENCES festival_participations (id),
  FOREIGN KEY (product_display_id) REFERENCES product_displays (product_display_id)
);
