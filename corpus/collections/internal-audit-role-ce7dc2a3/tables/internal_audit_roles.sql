CREATE TABLE internal_audit_roles (
  internal_audit_role_id INTEGER NOT NULL,
  role_identifier VARCHAR(32),
  role_title VARCHAR(32),
  standard_compliance_status VARCHAR(32),
  contracting_organisation VARCHAR(54),
  shared_service_flag BOOLEAN,
  last_review_date TIMESTAMP,
  performance_rating DECIMAL,
  public_service_organisation_id INTEGER,
  governance_framework_id INTEGER,
  PRIMARY KEY (internal_audit_role_id),
  FOREIGN KEY (public_service_organisation_id) REFERENCES public_service_organisations (id),
  FOREIGN KEY (governance_framework_id) REFERENCES governance_frameworks (governance_framework_id)
);
