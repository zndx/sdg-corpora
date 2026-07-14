CREATE TABLE emergency_contacts (
  id INTEGER NOT NULL,
  contact_name VARCHAR(32),
  contact_phone VARCHAR(32),
  parent_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (parent_id) REFERENCES parents (id)
);
