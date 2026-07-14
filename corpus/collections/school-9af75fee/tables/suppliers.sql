CREATE TABLE suppliers (
  id INTEGER NOT NULL,
  supplier_id VARCHAR(33),
  name VARCHAR(32),
  country_of_origin VARCHAR(32),
  certification_level VARCHAR(32),
  market_share DECIMAL,
  contact_email VARCHAR(32),
  school_id INTEGER,
  country_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (school_id) REFERENCES schools (id),
  FOREIGN KEY (country_id) REFERENCES countries (id)
);
