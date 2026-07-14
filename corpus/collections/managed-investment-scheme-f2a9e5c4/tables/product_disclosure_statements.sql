CREATE TABLE product_disclosure_statements (
  id INTEGER NOT NULL,
  pds_id VARCHAR(44),
  issue_date TIMESTAMP,
  version_number INTEGER,
  regulatory_status VARCHAR(32),
  document_url VARCHAR(55),
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (id)
);
