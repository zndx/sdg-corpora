CREATE TABLE referral_sources (
  referral_source_id INTEGER NOT NULL,
  source_id VARCHAR(44),
  source_name VARCHAR(32),
  other_details VARCHAR(32),
  enrollment_id INTEGER,
  PRIMARY KEY (referral_source_id),
  FOREIGN KEY (enrollment_id) REFERENCES enrollments (id)
);
