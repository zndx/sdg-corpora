CREATE TABLE publications (
  id INTEGER NOT NULL,
  publication_id VARCHAR(39),
  title VARCHAR(32),
  publication_date TIMESTAMP,
  journal_name VARCHAR(32),
  is_international BOOLEAN,
  citation_count INTEGER,
  faculty_researcher_id INTEGER,
  journal_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (faculty_researcher_id) REFERENCES faculty_researchers (id),
  FOREIGN KEY (journal_id) REFERENCES journals (journal_id)
);
