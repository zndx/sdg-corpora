CREATE TABLE CurriculumSubtopic (
  id INTEGER NOT NULL,
  subtopicId INTEGER,
  subtopicName VARCHAR(32),
  bfoGenus VARCHAR(32),
  isAbstract BOOLEAN,
  difficultyRating DECIMAL,
  topicId INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (topicId) REFERENCES CurriculumTopic (id)
);
