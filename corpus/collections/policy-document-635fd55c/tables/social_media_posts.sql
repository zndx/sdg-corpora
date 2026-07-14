CREATE TABLE social_media_posts (
  social_media_post_id INTEGER NOT NULL,
  post_id VARCHAR(32),
  content VARCHAR(32),
  post_date TIMESTAMP,
  post_type VARCHAR(32),
  is_official BOOLEAN,
  is_monitored BOOLEAN,
  is_subject_to_disclosure BOOLEAN,
  social_media_platform_id INTEGER,
  personnel_role_id INTEGER,
  policy_document_policy_number VARCHAR(32),
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (social_media_post_id),
  FOREIGN KEY (social_media_platform_id) REFERENCES social_media_platforms (social_media_platform_id),
  FOREIGN KEY (personnel_role_id) REFERENCES personnel_roles (id),
  FOREIGN KEY (policy_document_policy_number) REFERENCES policy_documents (policy_number)
);
