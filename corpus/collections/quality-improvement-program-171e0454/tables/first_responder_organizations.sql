CREATE TABLE first_responder_organizations (
  first_responder_organization_id INTEGER NOT NULL,
  organization_i_d VARCHAR(39),
  organization_name VARCHAR(32),
  jurisdiction VARCHAR(32),
  established_date DATE,
  service_type VARCHAR(32),
  participation_status VARCHAR(32),
  quality_improvement_program_id INTEGER,
  municipality_id INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (first_responder_organization_id),
  FOREIGN KEY (quality_improvement_program_id) REFERENCES quality_improvement_programs (quality_improvement_program_id),
  FOREIGN KEY (municipality_id) REFERENCES municipalities (id)
);
