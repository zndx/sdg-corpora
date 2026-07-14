CREATE TABLE special_interest_groups (
  id INTEGER NOT NULL,
  identifier VARCHAR(32),
  name VARCHAR(32),
  founding_year INTEGER,
  status VARCHAR(32),
  mission_statement VARCHAR(32),
  newsletter_id INTEGER,
  conference_id INTEGER,
  special_interest_group_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (newsletter_id) REFERENCES newsletters (id),
  FOREIGN KEY (conference_id) REFERENCES conferences (conference_id),
  FOREIGN KEY (special_interest_group_id) REFERENCES special_interest_groups (id)
);
