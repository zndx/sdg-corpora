CREATE TABLE organizations (
  id INTEGER NOT NULL,
  org_id VARCHAR(32),
  org_name VARCHAR(32),
  org_type VARCHAR(32),
  headquarters_location VARCHAR(32),
  listing_status VARCHAR(32),
  person_id INTEGER,
  business_venture_id INTEGER,
  board_id VARCHAR(35),
  PRIMARY KEY (id),
  FOREIGN KEY (person_id) REFERENCES persons (id),
  FOREIGN KEY (business_venture_id) REFERENCES business_ventures (id),
  FOREIGN KEY (board_id) REFERENCES governance_boards (board_id)
);
