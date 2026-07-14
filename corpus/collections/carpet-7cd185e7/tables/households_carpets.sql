CREATE TABLE households_carpets (
  household_id INTEGER NOT NULL,
  carpet_id INTEGER NOT NULL,
  PRIMARY KEY (household_id, carpet_id),
  FOREIGN KEY (household_id) REFERENCES royal_households (household_id),
  FOREIGN KEY (carpet_id) REFERENCES carpets (id)
);
