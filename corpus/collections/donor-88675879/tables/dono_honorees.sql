CREATE TABLE dono_honorees (
  honoree_id INTEGER NOT NULL,
  honoree_name VARCHAR(32),
  is_memorial BOOLEAN,
  donation_id INTEGER,
  notification_contact_id INTEGER,
  PRIMARY KEY (honoree_id),
  FOREIGN KEY (donation_id) REFERENCES dono_donations (donation_id),
  FOREIGN KEY (notification_contact_id) REFERENCES dono_notification_contacts (id)
);
