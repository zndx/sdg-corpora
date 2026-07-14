CREATE TABLE donations (
  id INTEGER NOT NULL,
  donation_id VARCHAR(32),
  amount DECIMAL,
  currency_code VARCHAR(44),
  donation_date TIMESTAMP,
  status VARCHAR(32),
  is_anonymous BOOLEAN,
  spiritual_seeker_id INTEGER,
  spiritual_organization_id INTEGER,
  retreat_program_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (spiritual_seeker_id) REFERENCES spiritual_seekers (spiritual_seeker_id),
  FOREIGN KEY (spiritual_organization_id) REFERENCES spiritual_organizations (spiritual_organization_id),
  FOREIGN KEY (retreat_program_id) REFERENCES retreat_programs (id)
);
