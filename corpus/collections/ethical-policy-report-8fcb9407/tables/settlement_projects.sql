CREATE TABLE settlement_projects (
  id INTEGER NOT NULL,
  project_id VARCHAR(44),
  project_name VARCHAR(32),
  project_type VARCHAR(32),
  construction_status VARCHAR(32),
  funding_amount DECIMAL,
  territory_id INTEGER,
  entity_id VARCHAR(44),
  violation_id VARCHAR(32),
  PRIMARY KEY (id),
  FOREIGN KEY (territory_id) REFERENCES territories (territory_id),
  FOREIGN KEY (entity_id) REFERENCES corporate_entities (entity_id),
  FOREIGN KEY (violation_id) REFERENCES human_rights_violations (violation_id)
);
