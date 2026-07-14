CREATE TABLE partner_organizations (
  id INTEGER NOT NULL,
  org_id VARCHAR(32),
  org_name VARCHAR(32),
  sector VARCHAR(32),
  contract_start_date TIMESTAMP,
  contract_end_date TIMESTAMP,
  clinical_program_id INTEGER,
  genomic_dataset_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (clinical_program_id) REFERENCES clinical_programs (clinical_program_id),
  FOREIGN KEY (genomic_dataset_id) REFERENCES genomic_datasets (id)
);
