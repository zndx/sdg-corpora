CREATE TABLE lawyers (
  id INTEGER NOT NULL,
  bar_membership_number VARCHAR(32),
  lawyer_name VARCHAR(32),
  firm_name VARCHAR(32),
  office_location VARCHAR(32),
  certification_status VARCHAR(32),
  is_outof_state BOOLEAN,
  practice_areas VARCHAR(32),
  lawyer_id INTEGER,
  advertisement_id INTEGER,
  provides_referral_to_lawyer_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (lawyer_id) REFERENCES lawyers (id),
  FOREIGN KEY (advertisement_id) REFERENCES advertisements (id),
  FOREIGN KEY (provides_referral_to_lawyer_id) REFERENCES lawyers (id)
);
