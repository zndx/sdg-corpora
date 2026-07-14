CREATE TABLE proclamations_individuals (
  proclamation_id INTEGER NOT NULL,
  eligible_individual_id INTEGER NOT NULL,
  PRIMARY KEY (proclamation_id, eligible_individual_id),
  FOREIGN KEY (proclamation_id) REFERENCES proclamations (id),
  FOREIGN KEY (eligible_individual_id) REFERENCES eligible_individuals (eligible_individual_id)
);
