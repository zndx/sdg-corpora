CREATE TABLE StaffMember (
  id INTEGER NOT NULL,
  staffId INTEGER,
  staffName VARCHAR(32),
  role VARCHAR(32),
  specialism VARCHAR(32),
  isQualified BOOLEAN,
  yearsOfService INTEGER,
  workloadWellbeing VARCHAR(32),
  siteId INTEGER,
  programmeId INTEGER,
  enrolmentId INTEGER,
  outcomeId INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (siteId) REFERENCES SchoolSite (id),
  FOREIGN KEY (programmeId) REFERENCES CurriculumProgramme (programmeId),
  FOREIGN KEY (enrolmentId) REFERENCES StudentEnrolment (enrolmentId),
  FOREIGN KEY (outcomeId) REFERENCES StudentOutcome (id)
);
