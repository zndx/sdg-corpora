CREATE TABLE community_partnerships (
  id INTEGER NOT NULL,
  partnership_id VARCHAR(40),
  partnership_name VARCHAR(32),
  partner_type VARCHAR(32),
  start_date DATE,
  end_date DATE,
  is_active BOOLEAN,
  focus_area VARCHAR(32),
  librarian_id VARCHAR(32),
  digital_resource_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (librarian_id) REFERENCES school_librarians (librarian_id),
  FOREIGN KEY (digital_resource_id) REFERENCES digital_resources (digital_resource_id)
);
