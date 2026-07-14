CREATE TABLE forum_meetings (
  id INTEGER NOT NULL,
  meeting_id VARCHAR(44),
  meeting_date TIMESTAMP,
  meeting_type VARCHAR(32),
  venue VARCHAR(32),
  status VARCHAR(32),
  total_cost DECIMAL,
  director_id INTEGER,
  meeting_document_id INTEGER,
  action_item_id INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (director_id) REFERENCES safety_directors (director_id),
  FOREIGN KEY (meeting_document_id) REFERENCES meeting_documents (id),
  FOREIGN KEY (action_item_id) REFERENCES action_items (id)
);
