CREATE TABLE international_financial_institutions (
  id INTEGER NOT NULL,
  institution_id INTEGER,
  name VARCHAR(32),
  founding_year INTEGER,
  governance_structure VARCHAR(32),
  primary_mission VARCHAR(32),
  accountability_mechanism_id INTEGER,
  development_project_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (accountability_mechanism_id) REFERENCES accountability_mechanisms (id),
  FOREIGN KEY (development_project_id) REFERENCES development_projects (id)
);
