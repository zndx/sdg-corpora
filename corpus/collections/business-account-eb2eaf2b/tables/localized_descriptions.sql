CREATE TABLE localized_descriptions (
  id INTEGER NOT NULL,
  locale_code VARCHAR(32),
  text_content VARCHAR(32),
  translation_status VARCHAR(32),
  motion_element_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (motion_element_id) REFERENCES motion_elements (id)
);
