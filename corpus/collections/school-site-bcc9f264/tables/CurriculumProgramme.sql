CREATE TABLE CurriculumProgramme (
  programmeId INTEGER NOT NULL,
  programmeName VARCHAR(32),
  subjectArea VARCHAR(32),
  targetAgeGroup VARCHAR(32),
  isCore BOOLEAN,
  isVocational BOOLEAN,
  sequencingStrategy VARCHAR(32),
  phonicsApproach VARCHAR(32),
  siteId INTEGER,
  enrolmentId INTEGER,
  activityId INTEGER,
  outcomeId INTEGER,
  PRIMARY KEY (programmeId),
  FOREIGN KEY (siteId) REFERENCES SchoolSite (id),
  FOREIGN KEY (enrolmentId) REFERENCES StudentEnrolment (enrolmentId),
  FOREIGN KEY (activityId) REFERENCES LearningActivity (id),
  FOREIGN KEY (outcomeId) REFERENCES StudentOutcome (id)
);
