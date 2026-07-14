CREATE TABLE AssessmentItemStudentResponse (
  itemId INTEGER NOT NULL,
  responseId INTEGER NOT NULL,
  PRIMARY KEY (itemId, responseId),
  FOREIGN KEY (itemId) REFERENCES AssessmentItem (itemId),
  FOREIGN KEY (responseId) REFERENCES StudentResponse (id)
);
