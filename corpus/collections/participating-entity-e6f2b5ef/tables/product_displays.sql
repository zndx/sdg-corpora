CREATE TABLE product_displays (
  product_display_id INTEGER NOT NULL,
  display_id VARCHAR(44),
  product_name VARCHAR(32),
  product_category VARCHAR(32),
  quantity DECIMAL,
  unit_of_measure VARCHAR(32),
  price_per_unit DECIMAL,
  quality_grade VARCHAR(32),
  festival_participation_id INTEGER,
  festival_booth_id INTEGER,
  PRIMARY KEY (product_display_id),
  FOREIGN KEY (festival_participation_id) REFERENCES festival_participations (id),
  FOREIGN KEY (festival_booth_id) REFERENCES festival_booths (id)
);
