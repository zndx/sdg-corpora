CREATE TABLE school_library_programs (
  id INTEGER NOT NULL,
  program_id INTEGER,
  name VARCHAR(32),
  established_date DATE,
  last_review_date DATE,
  funding_level DECIMAL,
  operational_status VARCHAR(32),
  collection_size INTEGER,
  service_hours INTEGER,
  PRIMARY KEY (id)
);
