CREATE TABLE monarches_individuals (
  monarch_id INTEGER NOT NULL,
  eligible_individual_id INTEGER NOT NULL,
  PRIMARY KEY (monarch_id, eligible_individual_id),
  FOREIGN KEY (monarch_id) REFERENCES monarches (monarch_id),
  FOREIGN KEY (eligible_individual_id) REFERENCES eligible_individuals (eligible_individual_id)
);
