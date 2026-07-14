CREATE TABLE financial_advisors (
  financial_advisor_id INTEGER NOT NULL,
  advisor_firm_name VARCHAR(32),
  service_category VARCHAR(32),
  contact_phone VARCHAR(32),
  advisor_representative VARCHAR(32),
  corporate_entity_id INTEGER,
  represents_corporate_entity_id INTEGER,
  PRIMARY KEY (financial_advisor_id),
  FOREIGN KEY (corporate_entity_id) REFERENCES corporate_entities (id),
  FOREIGN KEY (represents_corporate_entity_id) REFERENCES corporate_entities (id)
);
