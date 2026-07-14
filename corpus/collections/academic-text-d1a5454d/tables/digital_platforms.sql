CREATE TABLE digital_platforms (
  id INTEGER NOT NULL,
  platform_id VARCHAR(44),
  platform_name VARCHAR(32),
  version VARCHAR(32),
  provider VARCHAR(32),
  is_available BOOLEAN,
  academic_text_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (academic_text_id) REFERENCES academic_texts (id)
);
