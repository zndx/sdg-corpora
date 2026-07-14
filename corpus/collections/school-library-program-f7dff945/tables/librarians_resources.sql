CREATE TABLE librarians_resources (
  teacher_librarian_id INTEGER NOT NULL,
  resource_id INTEGER NOT NULL,
  PRIMARY KEY (teacher_librarian_id, resource_id),
  FOREIGN KEY (teacher_librarian_id) REFERENCES teacher_librarians (teacher_librarian_id),
  FOREIGN KEY (resource_id) REFERENCES information_resources (resource_id)
);
