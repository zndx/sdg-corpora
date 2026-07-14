CREATE TABLE governance_frameworks (
  governance_framework_id INTEGER NOT NULL,
  framework_id VARCHAR(44),
  framework_name VARCHAR(32),
  version VARCHAR(32),
  last_updated TIMESTAMP,
  compliance_score DECIMAL,
  risk_assessment_frequency VARCHAR(32),
  internal_audit_role_id INTEGER,
  public_service_organisation_id INTEGER,
  PRIMARY KEY (governance_framework_id),
  FOREIGN KEY (internal_audit_role_id) REFERENCES internal_audit_roles (internal_audit_role_id),
  FOREIGN KEY (public_service_organisation_id) REFERENCES public_service_organisations (id)
);
