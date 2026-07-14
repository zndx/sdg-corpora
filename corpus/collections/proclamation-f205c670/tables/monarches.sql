CREATE TABLE monarches (
  monarch_id INTEGER NOT NULL,
  title VARCHAR(32),
  reign_start_date DATE,
  reign_end_date DATE,
  fairness_rating DECIMAL,
  current_status VARCHAR(32),
  PRIMARY KEY (monarch_id)
);
