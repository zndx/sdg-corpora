CREATE TABLE agreements_wells (
  lease_agreement_id INTEGER NOT NULL,
  extraction_well_id INTEGER NOT NULL,
  PRIMARY KEY (lease_agreement_id, extraction_well_id),
  FOREIGN KEY (lease_agreement_id) REFERENCES lease_agreements (lease_agreement_id),
  FOREIGN KEY (extraction_well_id) REFERENCES extraction_wells (id)
);
