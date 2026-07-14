CREATE TABLE accommodations_albinisms (
  environmental_accommodation_id INTEGER NOT NULL,
  person_with_albinism_id INTEGER NOT NULL,
  PRIMARY KEY (environmental_accommodation_id, person_with_albinism_id),
  FOREIGN KEY (environmental_accommodation_id) REFERENCES environmental_accommodations (environmental_accommodation_id),
  FOREIGN KEY (person_with_albinism_id) REFERENCES person_with_albinisms (person_with_albinism_id)
);
