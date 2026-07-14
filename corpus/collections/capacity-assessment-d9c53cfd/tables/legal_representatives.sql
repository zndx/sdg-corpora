CREATE TABLE legal_representatives (
  legal_representative_id INTEGER NOT NULL,
  representative_identifier VARCHAR(32),
  relationship_type VARCHAR(32),
  authorization_date TIMESTAMP,
  scope_of_authority VARCHAR(32),
  contact_information VARCHAR(32),
  individual_id INTEGER,
  PRIMARY KEY (legal_representative_id),
  FOREIGN KEY (individual_id) REFERENCES individuals (individual_id)
);
