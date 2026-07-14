CREATE TABLE corporate_entities (
  entity_id VARCHAR(44) NOT NULL,
  entity_name VARCHAR(32),
  industry_sector VARCHAR(32),
  country_of_operation VARCHAR(32),
  un_database_listed BOOLEAN,
  financial_institution_id INTEGER,
  territory_id INTEGER,
  settlement_project_id INTEGER,
  created_at TIMESTAMP,
  PRIMARY KEY (entity_id),
  FOREIGN KEY (financial_institution_id) REFERENCES financial_institutions (financial_institution_id),
  FOREIGN KEY (territory_id) REFERENCES territories (territory_id),
  FOREIGN KEY (settlement_project_id) REFERENCES settlement_projects (id)
);
