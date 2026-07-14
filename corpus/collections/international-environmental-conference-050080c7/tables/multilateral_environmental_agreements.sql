CREATE TABLE multilateral_environmental_agreements (
  multilateral_environmental_agreement_id INTEGER NOT NULL,
  agreement_id VARCHAR(44),
  title VARCHAR(32),
  entry_into_force_date TIMESTAMP,
  status VARCHAR(32),
  scope VARCHAR(32),
  environmental_declaration_id INTEGER,
  international_environmental_institution_id INTEGER,
  PRIMARY KEY (multilateral_environmental_agreement_id),
  FOREIGN KEY (environmental_declaration_id) REFERENCES environmental_declarations (id),
  FOREIGN KEY (international_environmental_institution_id) REFERENCES international_environmental_institutions (id)
);
