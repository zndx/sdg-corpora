CREATE TABLE universities (
  id INTEGER NOT NULL,
  university_id VARCHAR(40),
  university_name VARCHAR(32),
  location VARCHAR(32),
  country VARCHAR(32),
  research_output_rank INTEGER,
  faculty_researcher_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (faculty_researcher_id) REFERENCES faculty_researchers (id)
);
