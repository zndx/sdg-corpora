CREATE TABLE workshops_carpets (
  workshop_id INTEGER NOT NULL,
  carpet_id INTEGER NOT NULL,
  PRIMARY KEY (workshop_id, carpet_id),
  FOREIGN KEY (workshop_id) REFERENCES workshops (id),
  FOREIGN KEY (carpet_id) REFERENCES carpets (id)
);
