CREATE TABLE stigmas_albinisms (
  social_stigma_id INTEGER NOT NULL,
  person_with_albinism_id INTEGER NOT NULL,
  PRIMARY KEY (social_stigma_id, person_with_albinism_id),
  FOREIGN KEY (social_stigma_id) REFERENCES social_stigmas (id),
  FOREIGN KEY (person_with_albinism_id) REFERENCES person_with_albinisms (person_with_albinism_id)
);
