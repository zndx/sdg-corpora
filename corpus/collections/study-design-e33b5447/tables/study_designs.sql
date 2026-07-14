CREATE TABLE study_designs (
  id INTEGER NOT NULL,
  design_id VARCHAR(32),
  design_name VARCHAR(32),
  design_type VARCHAR(32),
  start_date TIMESTAMP,
  end_date TIMESTAMP,
  status VARCHAR(32),
  primary_objective VARCHAR(32),
  PRIMARY KEY (id)
);
