CREATE TABLE nursing_professionals (
  id INTEGER NOT NULL,
  professional_id INTEGER,
  full_name VARCHAR(36),
  registration_number VARCHAR(32),
  primary_qualification VARCHAR(32),
  years_of_experience INTEGER,
  current_role_title VARCHAR(32),
  has_fellowship BOOLEAN,
  health_trust_id INTEGER,
  nursing_forum_id INTEGER,
  quality_workstream_id INTEGER,
  educational_institution_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (health_trust_id) REFERENCES health_trusts (health_trust_id),
  FOREIGN KEY (nursing_forum_id) REFERENCES nursing_forums (nursing_forum_id),
  FOREIGN KEY (quality_workstream_id) REFERENCES quality_workstreams (quality_workstream_id),
  FOREIGN KEY (educational_institution_id) REFERENCES educational_institutions (id)
);
