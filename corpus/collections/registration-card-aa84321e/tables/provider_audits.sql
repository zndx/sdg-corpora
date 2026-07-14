CREATE TABLE provider_audits (
  id INTEGER NOT NULL,
  audit_id VARCHAR(32),
  audit_date TIMESTAMP,
  audit_type VARCHAR(32),
  audit_result VARCHAR(32),
  vat_excluded_price VARCHAR(32),
  provider_approval_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (provider_approval_id) REFERENCES provider_approvals (id)
);
