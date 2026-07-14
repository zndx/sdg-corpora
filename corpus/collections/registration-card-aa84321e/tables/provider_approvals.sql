CREATE TABLE provider_approvals (
  id INTEGER NOT NULL,
  approval_id INTEGER,
  approval_status VARCHAR(32),
  grant_date DATE,
  expiry_date DATE,
  vat_excluded_price VARCHAR(32),
  organisation_id VARCHAR(36),
  PRIMARY KEY (id),
  FOREIGN KEY (organisation_id) REFERENCES training_organisations (organisation_id)
);
