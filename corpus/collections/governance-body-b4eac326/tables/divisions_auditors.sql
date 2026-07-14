CREATE TABLE divisions_auditors (
  internal_auditing_division_id INTEGER NOT NULL,
  internal_auditor_id INTEGER NOT NULL,
  PRIMARY KEY (internal_auditing_division_id, internal_auditor_id),
  FOREIGN KEY (internal_auditing_division_id) REFERENCES internal_auditing_divisions (id),
  FOREIGN KEY (internal_auditor_id) REFERENCES internal_auditors (internal_auditor_id)
);
