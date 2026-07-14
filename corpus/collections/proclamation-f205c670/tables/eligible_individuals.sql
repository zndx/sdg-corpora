CREATE TABLE eligible_individuals (
  eligible_individual_id INTEGER NOT NULL,
  individual_id VARCHAR(44),
  full_name VARCHAR(36),
  age INTEGER,
  residence VARCHAR(32),
  eligibility_status VARCHAR(32),
  date_of_birth DATE,
  proclamation_id INTEGER,
  monarch_id INTEGER,
  PRIMARY KEY (eligible_individual_id),
  FOREIGN KEY (proclamation_id) REFERENCES proclamations (id),
  FOREIGN KEY (monarch_id) REFERENCES monarches (monarch_id)
);
