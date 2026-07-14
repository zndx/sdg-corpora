CREATE TABLE designers (
  id INTEGER NOT NULL,
  designer_id VARCHAR(44),
  designer_name VARCHAR(32),
  employment_status VARCHAR(32),
  career_start_year INTEGER,
  primary_skill VARCHAR(32),
  contact_email VARCHAR(32),
  design_firm_id INTEGER,
  design_competition_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (design_firm_id) REFERENCES design_firms (id),
  FOREIGN KEY (design_competition_id) REFERENCES design_competitions (id)
);
