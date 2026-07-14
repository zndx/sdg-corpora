CREATE TABLE health_indexes (
  index_id INTEGER NOT NULL,
  index_name VARCHAR(32),
  calculation_date TIMESTAMP,
  life_expectancy_score DECIMAL,
  happiness_score DECIMAL,
  ecological_footprint DECIMAL,
  global_rank INTEGER,
  state_code INTEGER,
  PRIMARY KEY (index_id),
  FOREIGN KEY (state_code) REFERENCES states (state_code)
);
