CREATE TABLE investigations (
  investigation_id INTEGER NOT NULL,
  case_number VARCHAR(32),
  start_date DATE,
  end_date DATE,
  status VARCHAR(32),
  lead_investigator VARCHAR(32),
  social_media_post_id INTEGER,
  personnel_role_id INTEGER,
  policy_document_policy_number VARCHAR(32),
  PRIMARY KEY (investigation_id),
  FOREIGN KEY (social_media_post_id) REFERENCES social_media_posts (social_media_post_id),
  FOREIGN KEY (personnel_role_id) REFERENCES personnel_roles (id),
  FOREIGN KEY (policy_document_policy_number) REFERENCES policy_documents (policy_number)
);
