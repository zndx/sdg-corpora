CREATE TABLE legislators (
  id INTEGER NOT NULL,
  legislator_id VARCHAR(35),
  full_name VARCHAR(36),
  role VARCHAR(32),
  contact_email VARCHAR(32),
  contact_phone VARCHAR(32),
  legislative_committee_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (legislative_committee_id) REFERENCES legislative_committees (id)
);
