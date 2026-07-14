CREATE TABLE CurriculumSubtopicAssessmentItem (
  subtopicId INTEGER NOT NULL,
  itemId INTEGER NOT NULL,
  PRIMARY KEY (subtopicId, itemId),
  FOREIGN KEY (subtopicId) REFERENCES CurriculumSubtopic (id),
  FOREIGN KEY (itemId) REFERENCES AssessmentItem (itemId)
);
