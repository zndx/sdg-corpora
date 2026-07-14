CREATE TABLE supports_professionals (
  clinical_decision_support_cds_id VARCHAR(44) NOT NULL,
  healthcare_professional_id INTEGER NOT NULL,
  PRIMARY KEY (clinical_decision_support_cds_id, healthcare_professional_id),
  FOREIGN KEY (clinical_decision_support_cds_id) REFERENCES clinical_decision_supports (cds_id),
  FOREIGN KEY (healthcare_professional_id) REFERENCES healthcare_professionals (id)
);
