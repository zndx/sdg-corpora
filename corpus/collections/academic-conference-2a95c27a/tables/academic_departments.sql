CREATE TABLE academic_departments (
  academic_department_id INTEGER NOT NULL,
  identifier VARCHAR(32),
  name VARCHAR(32),
  head_name VARCHAR(32),
  contact_email VARCHAR(32),
  contact_phone VARCHAR(32),
  academic_institution_id INTEGER,
  local_organization_committee_id INTEGER,
  created_at TIMESTAMP,
  PRIMARY KEY (academic_department_id),
  FOREIGN KEY (academic_institution_id) REFERENCES academic_institutions (id),
  FOREIGN KEY (local_organization_committee_id) REFERENCES local_organization_committees (id)
);
