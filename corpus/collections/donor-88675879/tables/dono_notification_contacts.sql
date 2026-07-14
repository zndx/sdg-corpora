CREATE TABLE dono_notification_contacts (
  id INTEGER NOT NULL,
  contact_id VARCHAR(32),
  contact_name VARCHAR(32),
  street_address VARCHAR(32),
  city VARCHAR(32),
  state VARCHAR(32),
  zip_code VARCHAR(44),
  relationship VARCHAR(32),
  honoree_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (honoree_id) REFERENCES dono_honorees (honoree_id)
);
