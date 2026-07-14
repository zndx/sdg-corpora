CREATE TABLE CurriculumTopic (
  id INTEGER NOT NULL,
  topicId VARCHAR(40),
  topicName VARCHAR(32),
  bfoGenus VARCHAR(32),
  complexityLevel INTEGER,
  isCore BOOLEAN,
  requiresPrerequisiteTopicId INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (requiresPrerequisiteTopicId) REFERENCES CurriculumTopic (id)
);
