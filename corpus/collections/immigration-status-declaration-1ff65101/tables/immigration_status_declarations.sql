CREATE TABLE immigration_status_declarations (
  id INTEGER NOT NULL,
  declaration_id VARCHAR(35),
  declaration_date DATE,
  revision_date DATE,
  form_version VARCHAR(32),
  certification_status VARCHAR(32),
  perjury_acknowledged BOOLEAN,
  member_id INTEGER,
  minor_dependent_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (member_id) REFERENCES household_members (member_id),
  FOREIGN KEY (minor_dependent_id) REFERENCES minor_dependents (minor_dependent_id)
);
