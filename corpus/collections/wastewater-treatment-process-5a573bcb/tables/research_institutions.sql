CREATE TABLE research_institutions (
  id INTEGER NOT NULL,
  institution_identifier VARCHAR(32),
  institution_name VARCHAR(32),
  country VARCHAR(32),
  institution_type VARCHAR(32),
  establishment_date DATE,
  PRIMARY KEY (id)
);
