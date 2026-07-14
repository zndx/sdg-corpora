CREATE TABLE public_service_organisations (
  id INTEGER NOT NULL,
  organisation_id VARCHAR(36),
  organisation_name VARCHAR(33),
  jurisdiction VARCHAR(32),
  establishment_date DATE,
  service_type VARCHAR(32),
  annual_budget VARCHAR(32),
  governance_maturity_level INTEGER,
  internal_audit_role_id INTEGER,
  audit_standard_id INTEGER,
  committee_id VARCHAR(32),
  PRIMARY KEY (id),
  FOREIGN KEY (internal_audit_role_id) REFERENCES internal_audit_roles (internal_audit_role_id),
  FOREIGN KEY (audit_standard_id) REFERENCES audit_standards (id),
  FOREIGN KEY (committee_id) REFERENCES audit_committees (committee_id)
);
