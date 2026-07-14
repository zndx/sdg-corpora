CREATE TABLE StudentOutcome (
  id INTEGER NOT NULL,
  outcomeId VARCHAR(32),
  outcomeType VARCHAR(32),
  qualificationName VARCHAR(32),
  qualificationGrade VARCHAR(32),
  destinationType VARCHAR(32),
  destinationProvider VARCHAR(32),
  achievementDate DATE,
  isSuccessful BOOLEAN,
  enrolmentId INTEGER,
  programmeId INTEGER,
  memberId INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (enrolmentId) REFERENCES StudentEnrolment (enrolmentId),
  FOREIGN KEY (programmeId) REFERENCES CurriculumProgramme (programmeId),
  FOREIGN KEY (memberId) REFERENCES StaffMember (id)
);
