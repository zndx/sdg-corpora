CREATE TABLE social_media_platforms (
  social_media_platform_id INTEGER NOT NULL,
  platform_name VARCHAR(32),
  platform_url VARCHAR(65),
  is_official BOOLEAN,
  approval_date DATE,
  monitoring_section VARCHAR(32),
  contact_info VARCHAR(32),
  personnel_role_id INTEGER,
  policy_document_policy_number VARCHAR(32),
  social_media_post_id INTEGER,
  PRIMARY KEY (social_media_platform_id),
  FOREIGN KEY (personnel_role_id) REFERENCES personnel_roles (id),
  FOREIGN KEY (policy_document_policy_number) REFERENCES policy_documents (policy_number),
  FOREIGN KEY (social_media_post_id) REFERENCES social_media_posts (social_media_post_id)
);
