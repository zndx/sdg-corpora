CREATE TABLE workshops_craftspersons (
  workshop_id INTEGER NOT NULL,
  craftsperson_id INTEGER NOT NULL,
  PRIMARY KEY (workshop_id, craftsperson_id),
  FOREIGN KEY (workshop_id) REFERENCES workshops (id),
  FOREIGN KEY (craftsperson_id) REFERENCES craftspersons (id)
);
