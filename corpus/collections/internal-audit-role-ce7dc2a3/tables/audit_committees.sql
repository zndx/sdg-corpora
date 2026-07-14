CREATE TABLE audit_committees (
  committee_id VARCHAR(32) NOT NULL,
  committee_name VARCHAR(32),
  establishment_date DATE,
  meeting_frequency VARCHAR(32),
  member_count INTEGER,
  independence_level VARCHAR(32),
  internal_audit_role_id INTEGER,
  public_service_organisation_id INTEGER,
  PRIMARY KEY (committee_id),
  FOREIGN KEY (internal_audit_role_id) REFERENCES internal_audit_roles (internal_audit_role_id),
  FOREIGN KEY (public_service_organisation_id) REFERENCES public_service_organisations (id)
);
