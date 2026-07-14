CREATE TABLE shelters_households (
  shelter_id INTEGER NOT NULL,
  household_id INTEGER NOT NULL,
  PRIMARY KEY (shelter_id, household_id),
  FOREIGN KEY (shelter_id) REFERENCES shelters (id),
  FOREIGN KEY (household_id) REFERENCES households (id)
);
