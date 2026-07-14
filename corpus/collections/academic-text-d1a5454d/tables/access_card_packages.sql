CREATE TABLE access_card_packages (
  id INTEGER NOT NULL,
  package_id VARCHAR(32),
  access_duration VARCHAR(32),
  platform_name VARCHAR(32),
  status VARCHAR(32),
  activation_date TIMESTAMP,
  digital_platform_id INTEGER,
  academic_text_id INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (digital_platform_id) REFERENCES digital_platforms (id),
  FOREIGN KEY (academic_text_id) REFERENCES academic_texts (id)
);
