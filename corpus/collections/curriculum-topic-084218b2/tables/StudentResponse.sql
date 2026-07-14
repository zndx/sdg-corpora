CREATE TABLE StudentResponse (
  id INTEGER NOT NULL,
  responseId VARCHAR(35),
  responseValue VARCHAR(32),
  isCorrect BOOLEAN,
  scoreEarned DECIMAL,
  responseTimestamp TIMESTAMP,
  attemptNumber INTEGER,
  itemId INTEGER,
  studentId INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (itemId) REFERENCES AssessmentItem (itemId),
  FOREIGN KEY (studentId) REFERENCES Student (studentId)
);
