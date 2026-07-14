CREATE TABLE schools_albinisms (
  mainstream_school_id INTEGER NOT NULL,
  person_with_albinism_id INTEGER NOT NULL,
  PRIMARY KEY (mainstream_school_id, person_with_albinism_id),
  FOREIGN KEY (mainstream_school_id) REFERENCES mainstream_schools (id),
  FOREIGN KEY (person_with_albinism_id) REFERENCES person_with_albinisms (person_with_albinism_id)
);
