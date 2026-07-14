CREATE TABLE journeys (
  journey_id INTEGER NOT NULL,
  start_date TIMESTAMP,
  end_date TIMESTAMP,
  purpose VARCHAR(32),
  status VARCHAR(32),
  total_distance DECIMAL,
  eligible_individual_id INTEGER,
  PRIMARY KEY (journey_id),
  FOREIGN KEY (eligible_individual_id) REFERENCES eligible_individuals (eligible_individual_id)
);
