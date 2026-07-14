CREATE TABLE representatives_interventions (
  legal_representative_id INTEGER NOT NULL,
  intervention_id INTEGER NOT NULL,
  PRIMARY KEY (legal_representative_id, intervention_id),
  FOREIGN KEY (legal_representative_id) REFERENCES legal_representatives (legal_representative_id),
  FOREIGN KEY (intervention_id) REFERENCES interventions (id)
);
