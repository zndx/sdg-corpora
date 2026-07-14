CREATE TABLE government_departments (
  government_department_id INTEGER NOT NULL,
  identifier VARCHAR(32),
  name VARCHAR(32),
  responsibility_area VARCHAR(32),
  crown_dependency_id INTEGER,
  overseas_territory_id INTEGER,
  PRIMARY KEY (government_department_id),
  FOREIGN KEY (crown_dependency_id) REFERENCES crown_dependencies (id),
  FOREIGN KEY (overseas_territory_id) REFERENCES overseas_territories (id)
);
