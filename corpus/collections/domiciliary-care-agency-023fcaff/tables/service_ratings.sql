CREATE TABLE service_ratings (
  service_rating_id INTEGER NOT NULL,
  rating_id INTEGER,
  safety_rating VARCHAR(32),
  effectiveness_rating VARCHAR(32),
  caring_rating VARCHAR(32),
  responsiveness_rating VARCHAR(32),
  well_led_rating VARCHAR(32),
  regulatory_inspection_id INTEGER,
  PRIMARY KEY (service_rating_id),
  FOREIGN KEY (regulatory_inspection_id) REFERENCES regulatory_inspections (regulatory_inspection_id)
);
