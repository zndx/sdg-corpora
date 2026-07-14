CREATE TABLE clinical_programs (
  clinical_program_id INTEGER NOT NULL,
  program_id INTEGER,
  start_date TIMESTAMP,
  end_date TIMESTAMP,
  program_type VARCHAR(32),
  target_disease VARCHAR(32),
  genomic_dataset_id INTEGER,
  partner_organization_id INTEGER,
  PRIMARY KEY (clinical_program_id),
  FOREIGN KEY (genomic_dataset_id) REFERENCES genomic_datasets (id),
  FOREIGN KEY (partner_organization_id) REFERENCES partner_organizations (id)
);
