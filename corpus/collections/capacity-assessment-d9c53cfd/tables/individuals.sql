CREATE TABLE individuals (
  individual_id INTEGER NOT NULL,
  individual_identifier VARCHAR(32),
  date_of_birth DATE,
  legal_status VARCHAR(32),
  primary_language VARCHAR(32),
  communication_needs VARCHAR(32),
  legal_representative_id INTEGER,
  PRIMARY KEY (individual_id),
  FOREIGN KEY (legal_representative_id) REFERENCES legal_representatives (legal_representative_id)
);
