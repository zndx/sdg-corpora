CREATE TABLE certification_scopes (
  certification_scope_id INTEGER NOT NULL,
  scope_description VARCHAR(32),
  activity_type VARCHAR(32),
  product_category VARCHAR(32),
  certification_record_id INTEGER,
  PRIMARY KEY (certification_scope_id),
  FOREIGN KEY (certification_record_id) REFERENCES certification_records (id)
);
