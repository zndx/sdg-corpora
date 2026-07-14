CREATE TABLE professional_society_roles (
  id INTEGER NOT NULL,
  role_instance_id VARCHAR(44),
  role_title VARCHAR(32),
  society_name VARCHAR(32),
  start_date DATE,
  end_date DATE,
  ru_credits_per_year INTEGER,
  applies_to_body_of_knowledge BOOLEAN,
  certified_professional_id INTEGER,
  activity_id VARCHAR(34),
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (certified_professional_id) REFERENCES certified_professionals (certified_professional_id),
  FOREIGN KEY (activity_id) REFERENCES professional_activities (activity_id)
);
