CREATE TABLE research_fields (
  field_code VARCHAR(44) NOT NULL,
  field_name VARCHAR(32),
  category VARCHAR(32),
  faculty_researcher_id INTEGER,
  PRIMARY KEY (field_code),
  FOREIGN KEY (faculty_researcher_id) REFERENCES faculty_researchers (id)
);
