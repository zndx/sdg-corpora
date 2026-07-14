CREATE TABLE news_organizations (
  id INTEGER NOT NULL,
  organization_name VARCHAR(32),
  founding_year INTEGER,
  headquarters_location VARCHAR(32),
  organization_type VARCHAR(32),
  is_defunct BOOLEAN,
  broadcast_program_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (broadcast_program_id) REFERENCES broadcast_programs (broadcast_program_id)
);
