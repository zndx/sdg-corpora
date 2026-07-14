CREATE TABLE certified_professionals (
  certified_professional_id INTEGER NOT NULL,
  professional_id INTEGER,
  certification_status VARCHAR(32),
  current_certification_period_start DATE,
  current_certification_period_end DATE,
  ru_requirement INTEGER,
  code_of_ethics_pledge VARCHAR(44),
  employment_type VARCHAR(32),
  recertification_application_id INTEGER,
  professional_society_role_id INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (certified_professional_id),
  FOREIGN KEY (recertification_application_id) REFERENCES recertification_applications (id),
  FOREIGN KEY (professional_society_role_id) REFERENCES professional_society_roles (id)
);
