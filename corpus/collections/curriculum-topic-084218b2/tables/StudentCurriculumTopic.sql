CREATE TABLE StudentCurriculumTopic (
  studentId INTEGER NOT NULL,
  topicId INTEGER NOT NULL,
  PRIMARY KEY (studentId, topicId),
  FOREIGN KEY (studentId) REFERENCES Student (studentId),
  FOREIGN KEY (topicId) REFERENCES CurriculumTopic (id)
);
