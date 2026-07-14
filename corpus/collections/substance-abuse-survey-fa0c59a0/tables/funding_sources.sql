CREATE TABLE funding_sources (
  id INTEGER NOT NULL,
  funding_id INTEGER,
  source_name VARCHAR(32),
  total_amount VARCHAR(32),
  currency VARCHAR(32),
  fiscal_year INTEGER,
  allocation_type VARCHAR(32),
  PRIMARY KEY (id)
);
