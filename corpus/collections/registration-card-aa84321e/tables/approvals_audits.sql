CREATE TABLE approvals_audits (
  provider_approval_id INTEGER NOT NULL,
  provider_audit_id INTEGER NOT NULL,
  PRIMARY KEY (provider_approval_id, provider_audit_id),
  FOREIGN KEY (provider_approval_id) REFERENCES provider_approvals (id),
  FOREIGN KEY (provider_audit_id) REFERENCES provider_audits (id)
);
