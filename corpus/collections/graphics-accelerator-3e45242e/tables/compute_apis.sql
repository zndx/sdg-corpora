CREATE TABLE compute_apis (
  id INTEGER NOT NULL,
  api_name VARCHAR(32),
  specification_version VARCHAR(32),
  programming_language_support VARCHAR(32),
  feature_set VARCHAR(32),
  PRIMARY KEY (id)
);
