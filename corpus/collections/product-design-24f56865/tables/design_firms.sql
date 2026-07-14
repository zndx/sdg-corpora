CREATE TABLE design_firms (
  id INTEGER NOT NULL,
  firm_id VARCHAR(44),
  firm_name VARCHAR(32),
  founding_year INTEGER,
  headquarters_location VARCHAR(32),
  firm_type VARCHAR(32),
  active_status BOOLEAN,
  design_competition_id INTEGER,
  design_firm_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (design_competition_id) REFERENCES design_competitions (id),
  FOREIGN KEY (design_firm_id) REFERENCES design_firms (id)
);
