CREATE TABLE TeacherCount (
  countId INTEGER NOT NULL,
  academicYear VARCHAR(32),
  totalTeachers INTEGER,
  malePercentage DECIMAL,
  femalePercentage DECIMAL,
  region VARCHAR(32),
  regionId INTEGER,
  enrollmentId INTEGER,
  PRIMARY KEY (countId),
  FOREIGN KEY (regionId) REFERENCES GeographicRegion (id),
  FOREIGN KEY (enrollmentId) REFERENCES EducationalEnrollment (enrollmentId)
);
