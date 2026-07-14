CREATE TABLE students_librarians (
  student_id VARCHAR(32) NOT NULL,
  teacher_librarian_id INTEGER NOT NULL,
  PRIMARY KEY (student_id, teacher_librarian_id),
  FOREIGN KEY (student_id) REFERENCES students (student_id),
  FOREIGN KEY (teacher_librarian_id) REFERENCES teacher_librarians (teacher_librarian_id)
);
