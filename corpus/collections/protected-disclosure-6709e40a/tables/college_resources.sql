CREATE TABLE college_resources (
  resource_id INTEGER NOT NULL,
  resource_type VARCHAR(32),
  description VARCHAR(32),
  value DECIMAL,
  owner VARCHAR(32),
  improper_conduct_id INTEGER,
  PRIMARY KEY (resource_id),
  FOREIGN KEY (improper_conduct_id) REFERENCES improper_conducts (id)
);
