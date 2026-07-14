CREATE TABLE design_competitions (
  id INTEGER NOT NULL,
  competition_id INTEGER,
  competition_name VARCHAR(32),
  competition_year INTEGER,
  organizer_name VARCHAR(32),
  evaluation_criteria VARCHAR(32),
  grand_prize_awarded BOOLEAN,
  design_firm_id INTEGER,
  designer_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (design_firm_id) REFERENCES design_firms (id),
  FOREIGN KEY (designer_id) REFERENCES designers (id)
);
