CREATE TABLE instruments_concepts (
  didactic_instrument_id INTEGER NOT NULL,
  mathematical_concept_id INTEGER NOT NULL,
  PRIMARY KEY (didactic_instrument_id, mathematical_concept_id),
  FOREIGN KEY (didactic_instrument_id) REFERENCES didactic_instruments (id),
  FOREIGN KEY (mathematical_concept_id) REFERENCES mathematical_concepts (id)
);
