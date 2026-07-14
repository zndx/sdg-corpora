CREATE TABLE ScientificDiscourse (
  discourseId VARCHAR(32) NOT NULL,
  discourseTitle VARCHAR(32),
  publicationDate TIMESTAMP,
  authorId VARCHAR(32),
  discourseType VARCHAR(32),
  keyThemes VARCHAR(32),
  researchId INTEGER,
  referencesDiscourseId VARCHAR(32),
  PRIMARY KEY (discourseId),
  FOREIGN KEY (researchId) REFERENCES CyberneticsResearch (researchId),
  FOREIGN KEY (referencesDiscourseId) REFERENCES ScientificDiscourse (discourseId)
);
