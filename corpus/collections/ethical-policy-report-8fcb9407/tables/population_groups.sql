CREATE TABLE population_groups (
  group_id VARCHAR(32) NOT NULL,
  group_name VARCHAR(32),
  population_size INTEGER,
  legal_status VARCHAR(32),
  prisoner_count INTEGER,
  violation_id VARCHAR(32),
  territory_id INTEGER,
  PRIMARY KEY (group_id),
  FOREIGN KEY (violation_id) REFERENCES human_rights_violations (violation_id),
  FOREIGN KEY (territory_id) REFERENCES territories (territory_id)
);
