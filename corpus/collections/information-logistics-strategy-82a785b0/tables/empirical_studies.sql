CREATE TABLE empirical_studies (
  id INTEGER NOT NULL,
  study_identifier VARCHAR(32),
  conducted_date TIMESTAMP,
  methodology VARCHAR(36),
  sample_size INTEGER,
  publication_status VARCHAR(32),
  journal_name VARCHAR(32),
  information_logistics_strategy_id INTEGER,
  organizational_performance_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (information_logistics_strategy_id) REFERENCES information_logistics_strategies (id),
  FOREIGN KEY (organizational_performance_id) REFERENCES organizational_performances (id)
);
