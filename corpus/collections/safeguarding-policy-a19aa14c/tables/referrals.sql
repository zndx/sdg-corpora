CREATE TABLE referrals (
  referral_id INTEGER NOT NULL,
  submitted_date TIMESTAMP,
  recipient_agency VARCHAR(36),
  agency_contact VARCHAR(37),
  referral_type VARCHAR(32),
  status VARCHAR(32),
  incident_id INTEGER,
  staff_member_staff_id INTEGER,
  PRIMARY KEY (referral_id),
  FOREIGN KEY (incident_id) REFERENCES incidents (id),
  FOREIGN KEY (staff_member_staff_id) REFERENCES staff_members (staff_id)
);
