CREATE TABLE associations_competitions (
  state_association_id INTEGER NOT NULL,
  competition_id INTEGER NOT NULL,
  PRIMARY KEY (state_association_id, competition_id),
  FOREIGN KEY (state_association_id) REFERENCES state_associations (state_association_id),
  FOREIGN KEY (competition_id) REFERENCES competitions (id)
);
