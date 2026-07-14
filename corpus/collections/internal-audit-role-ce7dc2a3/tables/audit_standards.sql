CREATE TABLE audit_standards (
  id INTEGER NOT NULL,
  standard_id INTEGER,
  standard_name VARCHAR(32),
  issuing_body VARCHAR(32),
  effective_date DATE,
  revision_number INTEGER,
  compliance_level VARCHAR(32),
  public_service_organisation_id INTEGER,
  created_at TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (public_service_organisation_id) REFERENCES public_service_organisations (id)
);
