CREATE TABLE StudentStudentResponse (
  studentId INTEGER NOT NULL,
  responseId INTEGER NOT NULL,
  PRIMARY KEY (studentId, responseId),
  FOREIGN KEY (studentId) REFERENCES Student (studentId),
  FOREIGN KEY (responseId) REFERENCES StudentResponse (id)
);
