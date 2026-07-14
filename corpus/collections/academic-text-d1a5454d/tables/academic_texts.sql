CREATE TABLE academic_texts (
  id INTEGER NOT NULL,
  isbn VARCHAR(32),
  edition VARCHAR(32),
  publication_date TIMESTAMP,
  format VARCHAR(32),
  suggested_retail_price DECIMAL,
  title VARCHAR(32),
  academic_author_id INTEGER,
  access_card_package_id INTEGER,
  digital_platform_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (academic_author_id) REFERENCES academic_authors (id),
  FOREIGN KEY (access_card_package_id) REFERENCES access_card_packages (id),
  FOREIGN KEY (digital_platform_id) REFERENCES digital_platforms (id)
);
