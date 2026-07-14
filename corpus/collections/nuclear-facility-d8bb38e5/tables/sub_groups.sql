CREATE TABLE sub_groups (
  id INTEGER NOT NULL,
  sub_group_id VARCHAR(44),
  sub_group_title VARCHAR(32),
  focus_area VARCHAR(32),
  is_active BOOLEAN,
  established_date DATE,
  director_id INTEGER,
  meeting_document_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (director_id) REFERENCES safety_directors (director_id),
  FOREIGN KEY (meeting_document_id) REFERENCES meeting_documents (id)
);
