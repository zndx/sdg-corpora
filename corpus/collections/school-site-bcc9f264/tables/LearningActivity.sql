CREATE TABLE LearningActivity (
  id INTEGER NOT NULL,
  activityId VARCHAR(34),
  activityName VARCHAR(32),
  activityType VARCHAR(32),
  location VARCHAR(32),
  date TIMESTAMP,
  participantCount INTEGER,
  isOptional BOOLEAN,
  memberId INTEGER,
  enrolmentId INTEGER,
  programmeId INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (memberId) REFERENCES StaffMember (id),
  FOREIGN KEY (enrolmentId) REFERENCES StudentEnrolment (enrolmentId),
  FOREIGN KEY (programmeId) REFERENCES CurriculumProgramme (programmeId)
);
