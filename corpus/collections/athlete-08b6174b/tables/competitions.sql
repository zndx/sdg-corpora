CREATE TABLE competitions (
  id INTEGER NOT NULL,
  competition_id INTEGER,
  competition_name VARCHAR(32),
  competition_level VARCHAR(32),
  start_date DATE,
  end_date DATE,
  location VARCHAR(32),
  is_on_site_registration BOOLEAN,
  state_association_id INTEGER,
  qualifies_for_competition_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (state_association_id) REFERENCES state_associations (state_association_id),
  FOREIGN KEY (qualifies_for_competition_id) REFERENCES competitions (id)
);
