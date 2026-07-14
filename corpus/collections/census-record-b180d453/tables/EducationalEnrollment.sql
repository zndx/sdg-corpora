CREATE TABLE EducationalEnrollment (
  enrollmentId INTEGER NOT NULL,
  academicYear VARCHAR(32),
  totalStudents INTEGER,
  femalePercentage DECIMAL,
  region VARCHAR(32),
  schoolStage VARCHAR(32),
  regionId INTEGER,
  countId INTEGER,
  PRIMARY KEY (enrollmentId),
  FOREIGN KEY (regionId) REFERENCES GeographicRegion (id),
  FOREIGN KEY (countId) REFERENCES TeacherCount (countId)
);
