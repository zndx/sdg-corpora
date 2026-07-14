CREATE TABLE academic_ranks (
  id INTEGER NOT NULL,
  rank_code INTEGER,
  rank_title VARCHAR(32),
  level INTEGER,
  responsibilities VARCHAR(32),
  faculty_researcher_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (faculty_researcher_id) REFERENCES faculty_researchers (id)
);
