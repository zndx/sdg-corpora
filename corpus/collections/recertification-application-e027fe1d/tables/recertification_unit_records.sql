CREATE TABLE recertification_unit_records (
  recertification_unit_record_id INTEGER NOT NULL,
  record_id INTEGER,
  activity_category VARCHAR(42),
  sub_category VARCHAR(32),
  ru_credits_earned INTEGER,
  activity_date DATE,
  applies_to_body_of_knowledge BOOLEAN,
  double_counting_allowed BOOLEAN,
  verification_required BOOLEAN,
  recertification_application_id INTEGER,
  activity_id VARCHAR(34),
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (recertification_unit_record_id),
  FOREIGN KEY (recertification_application_id) REFERENCES recertification_applications (id),
  FOREIGN KEY (activity_id) REFERENCES professional_activities (activity_id)
);
