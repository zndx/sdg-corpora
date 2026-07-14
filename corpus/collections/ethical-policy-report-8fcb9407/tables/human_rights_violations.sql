CREATE TABLE human_rights_violations (
  violation_id VARCHAR(32) NOT NULL,
  violation_type VARCHAR(32),
  severity_level VARCHAR(32),
  date_reported DATE,
  documented_by VARCHAR(32),
  territory_id INTEGER,
  entity_id VARCHAR(44),
  group_id VARCHAR(32),
  PRIMARY KEY (violation_id),
  FOREIGN KEY (territory_id) REFERENCES territories (territory_id),
  FOREIGN KEY (entity_id) REFERENCES corporate_entities (entity_id),
  FOREIGN KEY (group_id) REFERENCES population_groups (group_id)
);
