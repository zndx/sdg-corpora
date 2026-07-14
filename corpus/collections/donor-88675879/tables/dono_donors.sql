CREATE TABLE dono_donors (
  donor_id VARCHAR(44) NOT NULL,
  donor_name VARCHAR(32),
  street_address VARCHAR(32),
  city VARCHAR(32),
  state VARCHAR(32),
  zip_code VARCHAR(44),
  email_address VARCHAR(32),
  is_anonymous BOOLEAN,
  donation_id INTEGER,
  contact_request_id INTEGER,
  PRIMARY KEY (donor_id),
  FOREIGN KEY (donation_id) REFERENCES dono_donations (donation_id),
  FOREIGN KEY (contact_request_id) REFERENCES dono_contact_requests (contact_request_id)
);
