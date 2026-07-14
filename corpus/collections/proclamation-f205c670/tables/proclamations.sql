CREATE TABLE proclamations (
  id INTEGER NOT NULL,
  proclamation_id VARCHAR(32),
  issuer VARCHAR(32),
  target_audience VARCHAR(32),
  date_issued TIMESTAMP,
  status VARCHAR(32),
  content_summary VARCHAR(32),
  monarch_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (monarch_id) REFERENCES monarches (monarch_id)
);
