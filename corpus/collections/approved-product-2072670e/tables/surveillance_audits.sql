CREATE TABLE surveillance_audits (
  id INTEGER NOT NULL,
  audit_identifier VARCHAR(32),
  audit_date TIMESTAMP,
  audit_outcome VARCHAR(32),
  auditor_name VARCHAR(32),
  findings_count INTEGER,
  next_audit_due DATE,
  approved_product_id INTEGER,
  approving_authority_id INTEGER,
  approval_standard_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (approved_product_id) REFERENCES approved_products (id),
  FOREIGN KEY (approving_authority_id) REFERENCES approving_authorities (approving_authority_id),
  FOREIGN KEY (approval_standard_id) REFERENCES approval_standards (approval_standard_id)
);
