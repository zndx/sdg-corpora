CREATE TABLE international_environmental_institutions (
  id INTEGER NOT NULL,
  institution_id INTEGER,
  name VARCHAR(32),
  headquarters_city VARCHAR(32),
  headquarters_country VARCHAR(32),
  establishment_date TIMESTAMP,
  status VARCHAR(32),
  international_environmental_conference_id INTEGER,
  multilateral_environmental_agreement_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (international_environmental_conference_id) REFERENCES international_environmental_conferences (id),
  FOREIGN KEY (multilateral_environmental_agreement_id) REFERENCES multilateral_environmental_agreements (multilateral_environmental_agreement_id)
);
