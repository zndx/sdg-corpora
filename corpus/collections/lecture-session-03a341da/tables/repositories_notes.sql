CREATE TABLE repositories_notes (
  digital_repository_id INTEGER NOT NULL,
  lecture_note_id INTEGER NOT NULL,
  PRIMARY KEY (digital_repository_id, lecture_note_id),
  FOREIGN KEY (digital_repository_id) REFERENCES digital_repositories (id),
  FOREIGN KEY (lecture_note_id) REFERENCES lecture_notes (id)
);
