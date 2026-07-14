CREATE TABLE AssessmentItem (
  itemId INTEGER NOT NULL,
  itemText VARCHAR(32),
  itemType VARCHAR(32),
  maxScore INTEGER,
  timeLimitSeconds INTEGER,
  isPublic BOOLEAN,
  subtopicId INTEGER,
  PRIMARY KEY (itemId),
  FOREIGN KEY (subtopicId) REFERENCES CurriculumSubtopic (id)
);
