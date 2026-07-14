CREATE TABLE dono_contact_requests (
  contact_request_id INTEGER NOT NULL,
  request_id INTEGER,
  discuss_deferred_giving BOOLEAN,
  volunteer_time BOOLEAN,
  join_newsletter BOOLEAN,
  donor_id VARCHAR(44),
  PRIMARY KEY (contact_request_id),
  FOREIGN KEY (donor_id) REFERENCES dono_donors (donor_id)
);
