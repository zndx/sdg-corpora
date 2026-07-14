CREATE TABLE meeting_documents (
  id INTEGER NOT NULL,
  document_id VARCHAR(44),
  document_type VARCHAR(32),
  publication_date DATE,
  version INTEGER,
  is_public BOOLEAN,
  forum_meeting_id INTEGER,
  director_id INTEGER,
  action_item_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (forum_meeting_id) REFERENCES forum_meetings (id),
  FOREIGN KEY (director_id) REFERENCES safety_directors (director_id),
  FOREIGN KEY (action_item_id) REFERENCES action_items (id)
);
