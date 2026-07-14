CREATE TABLE industrial_effluents (
  id INTEGER NOT NULL,
  effluent_identifier VARCHAR(32),
  source_industry VARCHAR(32),
  pollutant_concentration DECIMAL,
  biodegradability_status VARCHAR(32),
  toxicity_level VARCHAR(32),
  sample_collection_date TIMESTAMP,
  PRIMARY KEY (id)
);
