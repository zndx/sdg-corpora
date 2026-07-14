CREATE TABLE CurriculumTopicCurriculumSubtopic (
  topicId INTEGER NOT NULL,
  subtopicId INTEGER NOT NULL,
  PRIMARY KEY (topicId, subtopicId),
  FOREIGN KEY (topicId) REFERENCES CurriculumTopic (id),
  FOREIGN KEY (subtopicId) REFERENCES CurriculumSubtopic (id)
);
