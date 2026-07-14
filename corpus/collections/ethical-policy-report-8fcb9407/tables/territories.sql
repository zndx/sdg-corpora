CREATE TABLE territories (
  territory_id INTEGER NOT NULL,
  territory_name VARCHAR(32),
  legal_status VARCHAR(32),
  coordinates VARCHAR(32),
  recognized_by_u_n BOOLEAN,
  settlement_project_id INTEGER,
  violation_id VARCHAR(32),
  PRIMARY KEY (territory_id),
  FOREIGN KEY (settlement_project_id) REFERENCES settlement_projects (id),
  FOREIGN KEY (violation_id) REFERENCES human_rights_violations (violation_id)
);
